{}
# {inputs, ...}: {
# 	perSystem = {
# 		pkgs,
# 		lib,
# 		...
# 	}: {
# 		packages.niri =
# 			inputs.wrapper-modules.wrappers.niri.wrap {
# 				inherit pkgs;
#
# 				settings = {
# 					xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
# 				};
# 			};
# 	};
# }

