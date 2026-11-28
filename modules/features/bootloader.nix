{inputs, ...}: {
	flake.nixosModules.bootloader = {pkgs, ...}: {
		boot = {
			loader = {
				timeout = 0; # only show boot options if a key was pressed
				systemd-boot.enable = true;
				efi.canTouchEfiVariables = true;
			};

			# splash screens
			plymouth = {
				enable = true;
				theme = "nixos-chase"; # spinning lambdas
				themePackages = [
					(inputs.plymouth-spin.packages.${pkgs.stdenv.hostPlatform.system}.plymouth-nixos-chase.override
						{
							settings = {
								height = 800;
								ticks = 6; # update rate, lower is faster
								trail = 4; # how many lambdas after the current are still lit up
							};
						})
				];
				# HiDPI
				extraConfig = ''
					[Daemon]
					DeviceScale=1
				'';
			};

			# slience boot messages for splash screen
			consoleLogLevel = 3;
			kernelParams = [
				"quiet"
				"splash"
				"rd.udev.log_level=3"
				"rd.systemd.show_status=auto"
			];
		};
	};
}
