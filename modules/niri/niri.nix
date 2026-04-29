{
	perSystem = {
		inputs,
		pkgs,
		lib,
		...
	}: {
packages.niri = {
		inputs.wrapper-modules.wrappers.niri.wrap {
			inherit pkgs;

			settings = {
				# niri settings go here, or use modules
				binds."Mod+Q".spawn-sh = lib.getExe pkgs.kitty;
			};
		};
		}
}
