{
	flake.nixosModules.fonts = {
		pkgs,
		lib,
		...
	}: {
		fonts.packages = with pkgs;
			[
				# default font for nixos
				dejavu_fonts
				# clean sans font, good for typst
				paratype-pt-sans
				# default LaTeX font
				newcomputermodern
				# default typst font
				libertinus
				# inter font with nerd patches
				inter-nerdfont
				# noto font
				noto-fonts
			]
			++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
		# ^ enables all nerd fonts ^
	};
}
