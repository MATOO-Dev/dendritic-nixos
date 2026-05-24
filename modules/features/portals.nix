{
	flake.nixosModules.portals = {pkgs, ...}: {
		environment.systemPackages = with pkgs; [
			kdePackages.xdg-desktop-portal-kde
		];

		xdg.portal = {
			enable = true;
			xdgOpenUsePortal = true;
			config.common.default = "*";
			extraPortals = with pkgs; [kdePackages.xdg-desktop-portal-kde];
		};
	};
}
