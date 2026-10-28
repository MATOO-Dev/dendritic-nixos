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
				# noctalia ipc call state all > ./modules/features/noctalia.json
				inherit ((builtins.fromJSON (builtins.readFile ./noctalia.json))) settings;
				# TODO: consider porting config from json to nix
			};
	};
}
