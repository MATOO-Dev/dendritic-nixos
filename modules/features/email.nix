{
	flake.nixosModules.email = {pkgs, ...}: {
		services = {
			protonmail-bridge.enable = true;
			gnome.gnome-keyring.enable = true;
		};

		environment.systemPackages = with pkgs; [
			protonmail-bridge-gui
		];
	};

	flake.homeModules.email = {
		programs.thunderbird = {
			enable = true;
			settings = {
				"privacy.donottrackheader.enable" = true;
			};

			profiles.default = {
				isDefault = true;
			};
		};
	};
}
