{
	flake.homeModules.firefox = {pkgs, ...}: {
		programs.firefox = {
			enable = true;
			languagePacks = ["en-US"];
		};

		# add firefox to keywords for .desktop entry, and a secondary entry for private windows
		xdg.desktopEntries = let
			categories = ["Network" "WebBrowser"];
			genericName = "Web Browser";
			icon = "firefox";
			startupNotify = true;
			terminal = false;
			type = "Application";
			settings = {
				StartupWMClass = "firefox";
				Version = "1.5";
				Keywords = "web;browser;internet;firefox";
			};
		in {
			firefox = {
				name = "Firefox";
				exec = "firefox --new window %U";
				inherit categories genericName icon startupNotify terminal type settings;
			};
			firefox-private = {
				name = "Firefox: New private window";
				exec = "firefox --private-window %U";
				settings = settings // {StartupWMClass = "firefox-private";};
				inherit categories genericName icon startupNotify terminal type;
			};
		};
	};
}
