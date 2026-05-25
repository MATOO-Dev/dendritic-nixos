{
	flake.nixosModules.security = {pkgs, ...}: {
		services.gnome.gnome-keyring.enable = true;
		security.pam.services.ly.enableGnomeKeyring = true;
		security.polkit.enable = true;

		environment.systemPackages = with pkgs; [
			kdePackages.polkit-kde-agent-1
		];

		systemd.user.services.polkit-kde-agent-1 = {
			description = "KDE Polkit Authentication Agent";
			wantedBy = ["graphical-session.target"];
			wants = ["graphical-session.target"];
			after = ["graphical-session.target"];
			serviceConfig = {
				type = "simple";
				ExecStart = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1";
				Restart = "on-failure";
			};
		};
	};
}
