{
	flake.modules.noctalia.miscellaneous = {
		settings = {
			noctaliaPerformance = {
				disableWallpaper = true;
				disableDesktopWidgets = true;
			};
			plugins = {
				autoUpdate = false;
				notifyUpdates = true;
			};
			templates = {
				activeTemplates = [];
				enableUserTheming = false;
			};
			dock.enabled = false;
			hooks.enabled = false;
			desktopWidgets.enabled = false;
		};
	};
}
