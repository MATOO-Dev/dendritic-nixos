{
	flake.nixosModules.portals = {pkgs, ...}: {
		xdg.portal = {
			enable = true;
			xdgOpenUsePortal = true;
			extraPortals = with pkgs; [
				xdg-desktop-portal-gtk
				xdg-desktop-portal-gnome
				kdePackages.xdg-desktop-portal-kde
			];
			config = {
				common.default = ["gnome"];
				niri."org.freedesktop.impl.portal.FileChooser" = ["kde"];
			};
		};
	};
}
