{
	perSystem.packages.my-niri = {
		inputs,
		pkgs,
		...
	}:
		inputs.wrapper-modules.wrappers.niri.wrap {
			inherit pkgs;

			settings = {
				# niri settings go here, or use modules
			};
		};
}
