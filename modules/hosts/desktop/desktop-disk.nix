{}
# let
# 	primary_disk_path = "/dev/disk/by-uuid/164b2e71-1360-4ba3-a82f-b0bc37f93ffd";
# 	secondary_disk_path = "/dev/disk/by-uuid/497fc15d-d02f-416d-8e9b-d8ea53e7a7cb";
# 	tertiary_disk_path = "/dev/disk/by-uuid/0F2F343744FB65A2";
# 	mount_options = [
# 		"compress=zstd:3" # automatic file compression if possible
# 		"discard=async" # stagger discards to improve i/o
# 		"noatime" # disable file access time to reduce writes
# 		"space_cache=v2" # caches the location of free blocks
# 		"ssd" # ssd-specific optimizations
# 	];
# in {
# 	flake.nixosModules.desktop-disk = {inputs, ...}: {
# 		imports = [
# 			inputs.disko.nixosModules.default
# 		];
#
# 		disko.devices = {
# 			disk = {
# 				primary = {
# 					type = "disk";
# 					device = primary_disk_path;
# 					content = {
# 						type = "gpt";
# 						partitions = {
# 							# esp = efi system partition
# 							esp = {
# 								name = "ESP";
# 								size = "1G";
# 								type = "EF00";
# 								content = {
# 									type = "filesystem";
# 									format = "vfat";
# 									mountpoint = "/boot";
# 									mountOptions = ["umask=00777"];
# 								};
# 							};
# 							encrypedSwap = {
# 								size = "8G";
# 								content = {
# 									type = "swap";
# 									# mutually exclusive with resumeDevice
# 									randomEncryption = true;
# 								};
# 							};
# 							luks = {
# 								size = "100%";
# 								content = {
# 									type = "luks";
# 									name = "cryptroot";
# 									settings = {
# 										# discard means unused blocks are zeroed
# 										# the data is still encrypted, but one can
# 										# see which parts & how much of the disk is used
# 										allowDiscards = true;
# 									};
# 									content = {
# 										type = "btrfs";
# 										extraArgs = ["-f"];
# 										subvolumes = {
# 											"@" = {
# 												mountpoint = "/";
# 												mountOptions = mount_options;
# 											};
# 											"@home" = {
# 												mountpoint = "/home";
# 												mountOptions = mount_options;
# 											};
# 											"@nix" = {
# 												mountpoint = "/nix";
# 												mountOptions = mount_options;
# 											};
# 											"@var_log" = {
# 												mountpoint = "/var/log";
# 												mountOptions = mount_options;
# 											};
# 											"@snapshots" = {
# 												mountpoint = "/.snapshots";
# 												mountOptions = mount_options;
# 											};
# 											"@tmp" = {
# 												mountpoint = "/tmp";
# 												mountOptions = mount_options;
# 											};
# 										};
# 									};
# 								};
# 							};
# 						};
# 					};
# 				};
# 				secondary = {
# 					type = "disk";
# 					device = secondary_disk_path;
# 					content = {
# 						type = "gpt";
# 						partitions = {
# 							luks = {
# 								size = "100%";
# 								content = {
# 									type = "luks";
# 									name = "cryptsecond";
# 									settings = {
# 										allowDiscards = true;
# 									};
# 									content = {
# 										type = "btrfs";
# 										extraArgs = ["-f"];
# 										subvolumes = {
# 											"@games" = {
# 												mountpoint = "/home/matoo/Games";
# 												mountOptions = mount_options;
# 											};
# 										};
# 									};
# 								};
# 							};
# 						};
# 					};
# 				};
# 				# currently used for windows dual boot
# 				# havent used that in months though, might switch it over
# 				tertiary = {
# 					type = "disk";
# 					device = tertiary_disk_path;
# 					content = {
# 						type = "gpt";
# 						partitions = {
# 							luks = {
# 								size = "100%";
# 								content = {
# 									type = "luks";
# 									name = "cryptthird";
# 									settings = {
# 										allowDiscards = true;
# 									};
# 									content = {
# 										type = "btrfs";
# 										extraArgs = ["-f"];
# 										subvolumes = {
# 											"@backups" = {
# 												mountpoint = "/home/matoo/Backups";
# 												mountOptions = mount_options;
# 											};
# 										};
# 									};
# 								};
# 							};
# 						};
# 					};
# 				};
# 			};
# 		};
# 	};
# }

