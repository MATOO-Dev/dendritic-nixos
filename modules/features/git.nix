{
	flake.homeModules.git = {
		programs.git = {
			enable = true;

			settings = {
				user = {
					name = "MATOO-Dev";
					email = "matoo-dev@proton.me";
				};
				credential.heler = "store";
			};

			lfs.enable = true;

			maintenance = {
				enable = true;
				timers = {
					weekly = "Mon 08:00:00";
				};
			};
		};

		programs.ssh = {
			enable = true;
			addKeysToAgent = "yes";
		};

		programs.lazygit = {
			enable = true;
		};
	};
}
