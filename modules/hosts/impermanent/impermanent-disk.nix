{inputs, ...}: let
	# normally, use /dev/disk/by-id/ for this, its fine here since its a vm
	primary_disk_path = "/dev/vda";
	mount_options = [
		"compress=zstd:3" # automatic file compression if possible
		"discard=async" # stagger discards to improve i/o
		"noatime" # disable file access time to reduce writes
		"space_cache=v2" # caches the location of free blocks
		"ssd" # ssd-specific optimizations
	];
in {
	flake.diskoConfigurations.impermanent = {
		imports = [
			inputs.disko.nixosModules.disko
		];

		# ensure /nix is mounted before booting
		fileSystems."/nix".neededForBoot = true;
		fileSystems."/persistent".neededForBoot = true;

		disko.devices = {
			nodev = {
				"/" = {
					fsType = "tmpfs";
					mountOptions = [
						"size=25%" # max amount ram the tmpfs may occupy
						"mode=755" # root-only write access, r/x for everyone
					];
				};
			};
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
								size = "1G";
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
											"@nix" = {
												mountpoint = "/nix";
												mountOptions = mount_options;
											};
											"@persistent" = {
												mountpoint = "/persistent";
												mountOptions = mount_options;
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
	};
}
