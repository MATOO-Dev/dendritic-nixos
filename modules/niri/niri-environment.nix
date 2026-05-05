{
	flake.modules.niri.environment = {pkgs, lib, ...}: {
		settings = {
			environment = {
				# fix empty open-with in dolphin
				# this is kinda bad, since it pulls in
				# even though i dont use plasma
				"XDG_MENU_PREFIX" = "plasma-";
				# enable mangohud for all vulkan games
				"MANGOHUD" = "0";
				# automatically scale qt windows based on monitor dpi
				"QT_AUTO_SCREEN_SCALE_FACTOR" = "1";
			};

			clipboard = {
				# disable middle click paste
				# disable-primary = null;
			};

			hotkey-overlay = {
				skip-at-startup = _: {};
			};

			screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

            xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
		};
	};
}
