{
	inputs,
	self,
	...
}: {
	flake.nixosModules.niri = {pkgs, ...}: {
		programs.niri = {
			enable = true;
			package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
		};
		environment.systemPackages = with pkgs; [
			libnotify # notifications
			mako # notifications
			sunsetr # blue light filter
		];
		# fix empty open-with for dolphin
		environment.etc."xdg/menus/applications.menu".source = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
	};

	perSystem = {pkgs, ...}: {
		packages.niri =
			inputs.wrapper-modules.wrappers.niri.wrap {
				inherit pkgs;

				imports = with self.modules.niri; [
					animations
					autostart
					binds
					environment
					input
					layout
					monitors
					windowrules
				];
			};
	};
}
