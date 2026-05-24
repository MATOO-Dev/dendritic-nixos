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
			enableDefaultConfig = false;
			settings."github.com" = {
				user = "git";
				identityFile = "~/.ssh/id_ed25519";
			};
		};

		services.ssh-agent.enable = true;

		programs.lazygit = {
			enable = true;
		};
	};
}
