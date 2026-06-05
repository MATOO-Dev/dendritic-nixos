{self, ...}: {
	flake.homeModules.librewolf = {pkgs, ...}: {
		programs.librewolf = {
			enable = true;
			languagePacks = ["en-US"];
		};

		# add firefox to keywords for .desktop entry
		xdg.desktopEntries.librewolf = {
			categories = ["Network" "WebBrowser"];
			exec = "librewolf --name librewolf %U";
			genericName = "Web Browser";
			icon = "librewolf";
			# mimeType = [
			# 	"text/html"
			# 	"text/xml"
			# 	"application/xhtml+xml"
			# 	"application/vnd.mozilla.xul+xml"
			# ];
			name = "LibreWolf";
			startupNotify = true;
			terminal = false;
			type = "Application";
			settings = {
				StartupWMClass = "librewolf";
				Version = "1.5";
				Keywords = "web;browser;internet;firefox";
			};

			actions = {
				"new-window" = {
					name = "New Window";
					exec = "librewolf --new-window %U";
				};
				"new-private-window" = {
					name = "New Private Window";
					exec = "librewolf --private-window %U";
				};
			};
		};
	};
}
