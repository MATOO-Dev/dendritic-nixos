{
	flake.nixosModules.ssh = {pkgs, ...}: {
		# gnome keyring already acts as an ssh agent
		# therefore, do not enable programs.ssh itself
		services.gnome.gnome-keyring.enable = true;
		security.pam.services = {
			login.enableGnomeKeyring = true;
			ly.enableGnomeKeyring = true;
		};

		# for keys stored locally with only the passphrase in bitwarden
		programs.ssh.extraConfig = ''
			AddKeysToAgent yes
		'';

		# for ssh keys stored in bitwarden
		# programs.ssh.extraConfig = ''
		# 	Host github.com
		# 	IdentityAgent ~/.bitwarden-ssh-agent.sock
		# '';
	};
}
