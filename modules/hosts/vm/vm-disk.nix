let
	primary_disk_path = "/dev/vda";
	mount_options = [
		"compress=zstd:3" # automatic file compression if possible
		"discard=async" # stagger discards to improve i/o
		"noatime" # disable file access time to reduce writes
		"space_cache=v2" # caches the location of free blocks
		"ssd" # ssd-specific optimizations
	];
in {
	flake.diskoConfigurations.vm-disk = {
		disko.devices = {
			disk = {
				primary = {
					type = "disk";
					# fix for out of space error that happens only in VMs
					imageSize = "25G";
					device = primary_disk_path;
					content = {
						type = "gpt";
						partitions = {
							esp = {
								name = "ESP";
								size = "1G";
								type = "EF00";
								content = {
									type = "filesystem";
									format = "vfat";
									mountpoint = "/boot";
									mountOptions = ["umask=00777"];
								};
							};
							encrypedSwap = {
								size = "8G";
								content = {
									type = "swap";
									# mutually exclusive with resumeDevice
									randomEncryption = true;
								};
							};
							luks = {
								size = "100%";
								content = {
									type = "luks";
									name = "cryptroot";
									settings = {
										# discard means unused blocks are zeroed
										# the data is still encrypted, but one can
										# see which parts & how much of the disk is used
										allowDiscards = true;
									};
									content = {
										type = "btrfs";
										extraArgs = ["-f"];
										subvolumes = {
											"@" = {
												mountpoint = "/";
												mountOptions = mount_options;
											};
											"@home" = {
												mountpoint = "/home";
												mountOptions = mount_options;
											};
											"@nix" = {
												mountpoint = "/nix";
												mountOptions = mount_options;
											};
											"@var_log" = {
												mountpoint = "/var/log";
												mountOptions = mount_options;
											};
											"@snapshots" = {
												mountpoint = "/.snapshots";
												mountOptions = mount_options;
											};
											"@tmp" = {
												mountpoint = "/tmp";
												mountOptions = mount_options;
											};
											# on vm @games is omitted
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
}
