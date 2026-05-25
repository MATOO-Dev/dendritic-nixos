{
	flake.homeModules.git = {pkgs, ...}: {
		# home.packages = with pkgs; [libsecret];
		services.gnome-keyring.enable = true;

		programs.git = {
			enable = true;

			settings = {
				user = {
					name = "MATOO-Dev";
					email = "matoo-dev@proton.me";
				};
				credential.helper = "${pkgs.gitFull}/bin/git-credential-libsecret";
				core.askPass = "${pkgs.seahorse}/libexec/seahorse/ssh-askpass";
			};

			lfs.enable = true;

			maintenance = {
				enable = true;
				timers = {
					weekly = "Mon 08:00:00";
				};
			};
		};

		programs.lazygit = {
			enable = true;
		};

		# programs.ssh.settings."github.com" = {
		# 	user = "git";
		# 	identityFile = "~/.ssh/id_ed25519";
		# };
	};
}
