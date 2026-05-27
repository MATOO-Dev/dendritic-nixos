{
	flake.homeModules.defaultApps = {pkgs, ...}: {
		home.packages = [
			# requires file input to work
			# test if syntax is correct like this
			(pkgs.writeShellApplication {
					name = "find-mime-type";
					runtimeInputs = with pkgs; [file];
					text = ''file --mime-type -b "$1"'';
				})
			(pkgs.writeShellApplication {
					name = "find-desktop-filtered";
					runtimeInputs = with pkgs; [findutils ripgrep];
					text = ''
						# global packages
						# find /run/current-system/sw/share/applications | rg -i "$1"
						# user packages
						# find /etc/profiles/per-user/"$(id -n -u)"/share/applications | rg -i "$1"
						# home manager packages
						find ~/.nix-profile/share/applications | rg -i "$1"
						# global flatpaks
						# find /var/lib/flatpak/exports/share/applications | rg -i "$1"
						# user flatpaks
						# find ~/.local/share/flatpak/exports/share/applications | rg -i "$1"
					'';
				})
		];

		xdg.mime.enable = true;
		xdg.mimeApps = {
			enable = true;
			defaultApplications = {
				"application/pdf" = "org.gnome.Evince.desktop";
				"image/*" = "org.gnome.eog.desktop";
				"image/x-xcf" = "gimp.desktop";
				"x-scheme-handler/http" = "firefox.desktop";
				"x-scheme-handler/https" = "firefox.desktop";
				"x-scheme-handler/about" = "firefox.desktop";
				"x-scheme-handler/unknown" = "firefox.desktop";
			};
		};
	};
}
