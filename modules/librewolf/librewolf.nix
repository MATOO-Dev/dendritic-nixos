{
	flake.homeModules.librewolf = {pkgs, ...}: {
		programs.librewolf = {
			enable = true;
			languagePacks = ["en-US"];
		};

		# add firefox to keywords for .desktop entry, and a secondary entry for private windows
		xdg.desktopEntries = let
			categories = ["Network" "WebBrowser"];
			genericName = "Web Browser";
			icon = "librewolf";
			startupNotify = true;
			terminal = false;
			type = "Application";
			settings = {
				StartupWMClass = "librewolf";
				Version = "1.5";
				Keywords = "web;browser;internet;firefox";
			};
		in {
			librewolf = {
				name = "LibreWolf";
				exec = "librewolf --new window %U";
				inherit categories genericName icon startupNotify terminal type settings;
			};
			librewolf-private = {
				name = "LibreWolf: New private window";
				exec = "librewolf --private-window %U";
				settings = settings // {StartupWMClass = "librewolf-private";};
				inherit categories genericName icon startupNotify terminal type;
			};
		};
	};
}
