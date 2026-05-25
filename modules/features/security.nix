{
	flake.nixosModules.ssh = {pkgs, ...}: {
		# gnome keyring already acts as an ssh agent
		# therefore, do not enable programs.ssh itself
		services.gnome.gnome-keyring.enable = true;
		security.pam.services = {
			login.enableGnomeKeyring = true;
			ly.enableGnomeKeyring = true;
		};

		programs.ssh.extraConfig = ''
			AddKeysToAgent yes
		'';
	};
}
