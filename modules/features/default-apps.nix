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
					# TODO: fix this so it finds all desktop files in all locations
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
				"application/epub+zip" = "com.github.johnfactotum.Foliate.desktop";
				"application/pdf" = "org.gnome.Evince.desktop";
				"application/x-pixieditor" = "pixieditor.desktop";
				"application/zip" = "org.kde.ark.desktop";
				"audio/mpeg" = "mpv.desktop";
				"image/gif" = "org.gnome.eog.desktop";
				"image/jpeg" = "org.gnome.eog.desktop";
				"image/png" = "org.gnome.eog.desktop";
				"image/x-xcf" = "gimp.desktop";
				"text/markdown" = "nvim.desktop";
				"text/plain" = "nvim.desktop";
				"text/vnd.typst" = "nvim.desktop";
				"video/mp4" = "mpv.desktop";
				"video/webm" = "mpv.desktop";
				"video/x-matroska" = "mpv.desktop";
				"x-scheme-handler/about" = "firefox.desktop";
				"x-scheme-handler/http" = "firefox.desktop";
				"x-scheme-handler/https" = "firefox.desktop";
				"x-scheme-handler/unknown" = "firefox.desktop";
			};
		};
	};
}
