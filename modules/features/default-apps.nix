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
		];

		xdg.mime.enable = true;
		xdg.mimeApps = {
			enable = true;
			defaultApplications = {
				"application/pdf" = "org.gnome.Evince.desktop";
				"image/*" = "org.gnome.eog.desktop";
				"x-scheme-handler/http" = "firefox.desktop";
				"x-scheme-handler/https" = "firefox.desktop";
				"x-scheme-handler/about" = "firefox.desktop";
				"x-scheme-handler/unknown" = "firefox.desktop";
			};
		};
	};
}
