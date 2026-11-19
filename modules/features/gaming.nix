{
	flake.nixosModules.gaming = {pkgs, ...}: {
		programs.steam = {
			enable = true;
			remotePlay.openFirewall = true;
			dedicatedServer.openFirewall = false;
			localNetworkGameTransfers.openFirewall = true;
			extraCompatPackages = with pkgs; [
				unstable.proton-ge-bin
			];

			# override the default steam package
			package =
				pkgs.unstable.steam.override {
					# launch options that apply to all games
					extraEnv = {
						MANGOHUD = "0"; # disable mangohud by default
						STEAMDECK = "1"; # skips launchers for some games
						GAMEMODERUN = "1"; # launch with gamemode
						PROTON_ENABLE_WAYLAND = "1"; # run the game using wayland
					};
				};
		};

		# optimize system performance for gaming
		programs.gamemode.enable = true;

		# enable gamescope session
		programs.gamescope.enable = true;

		# xbox controller driver
		hardware.xpadneo.enable = true;
	};

	flake.homeModules.gaming = {pkgs, ...}: {
		programs.mangohud.enable = true;

		programs.lutris = {
			enable = false;
			defaultWinePackage = pkgs.unstable.proton-ge-bin;
		};

		home.packages = with pkgs; [
			beyond-all-reason # FOSS RTS game
			heroic # game launcher for GOG, etc.
			prismlauncher # minecraft launcher
			protonplus # proton version manager
			r2modman # modding tool
			unstable.vintagestory # survival game
		];
	};
}
