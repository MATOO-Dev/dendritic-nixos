{
}
# {
# 	flake.homeModules.theming = {
# 		inputs,
# 		pkgs,
# 		...
# 	}: {
# 		imports = [inputs.stylix.homeModules.stylix];
#
# 		stylix = {
# 			enable = true;
# 			polarity = "dark";
# 			autoEnable = false;
# 			base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
# 			targets = {
# 				rofi.enable = true;
# 				gtk.enable = true;
# 				qt.enable = true;
# 				vesktop.enable = true;
# 			};
# 		};
#
# 		# xdg.configFile.kdeglobals = {
# 		#     enable = true;
# 		#     # fix for dolphin theming, see https://github.com/nix-community/stylix/issues/2183
# 		#     text = ''
# 		#         [UiSettings]
# 		#         ColorScheme=*
# 		#     '';
# 		# };
# 	};
# }

