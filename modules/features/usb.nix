{
	flake.nixosModules.usb = {
		services.udisks2.enable = true;
	};

	flake.homeModules.usb = {pkgs, ...}: {
		services.udiskie = {
			enable = true;
			settings = {
				program_options.file_manager = "${pkgs.nautilus}/bin/nautilus";
			};
		};
	};
}
