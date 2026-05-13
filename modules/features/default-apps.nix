{
	flake.homeModules.defaultApps = {pkgs, ...}: {
		home.packages = [
			# requires file input to work
			# test if syntax is correct like this
			(pkgs.writeShellScriptBin "find-mime-type" ''
					${pkgs.file}/bin/file --mime-type -b
				'')
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
