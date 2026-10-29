{
	inputs,
	self,
	...
}: {
	flake.homeModules.noctalia = {pkgs, ...}: {
		home.packages = [
			self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia
		];
	};

	perSystem = {pkgs, ...}: {
		packages.noctalia =
			inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
				inherit pkgs;
				# to regenerate settings file, run
				# noctalia-shell ipc call state all > ./modules/noctalia/noctalia.json
				# inherit ((builtins.fromJSON (builtins.readFile ./noctalia.json))) settings;
				# TODO: consider porting config from json to nix
				imports = with self.modules.noctalia; [
					bar
					general
					ui
					location
					calendar
					wallpaper
					launcher
					controlCenter
					systemMonitor
					sessionMenu
					notifications
					network
					audio
					miscellaneous
					idle
					nightLight
					colorSchemes
					brightness
					onScreenDisplay
				];
			};
	};
}
