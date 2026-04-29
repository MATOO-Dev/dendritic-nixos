{}
# {
# 	flake.nixosModules.gaming = {pkgs, ...}: {
# 		programs.steam = {
# 			enable = true;
# 			remotePlay.openFirewall = true;
# 			dedicatedServer.openFirewall = false;
# 			localNetworkGameTransfers.openFirewall = true;
# 			extraCompatPackages = with pkgs; [
# 				proton-ge-bin
# 			];
#
# 			# override the default steam package
# 			package =
# 				pkgs.steam.override {
# 					# launch options that apply to all games
# 					extraEnv = {
# 						MANGOHUD = "0"; # disable mangohud by default
# 						STEAMDECK = "1"; # skips launchers for some games
# 						GAMEMODERUN = "1"; # launch with gamemode
# 						PROTON_ENABLE_WAYLAND = "0"; # run the game using wayland
# 					};
# 				};
# 		};
#
# 		# optimize system performance for gaming
# 		programs.gamemode.enable = true;
#
# 		# xbox controller driver
# 		hardware.xpadneo.enable = true;
# 	};
#
# 	flake.homeModules.gaming = {pkgs, ...}: {
# 		programs.mangohud.enable = true;
#
# 		programs.lutris = {
# 			enable = false;
# 			defaultWinePackage = pkgs.proton-ge-bin;
# 		};
#
# 		home.packages = with pkgs; [
# 			beyond-all-reason # FOSS RTS game
# 			heroic # game launcher for GOG, etc.
# 			prismlauncher # minecraft launcher
# 			r2modman # modding tool
# 			vintagestory # survival game
# 		];
# 	};
# }

