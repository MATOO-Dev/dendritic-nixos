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
			mako # notifications
			sunsetr # blue light filter
			# kdePackages.polkit-kde-agent-1 # password prompt
		];
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
