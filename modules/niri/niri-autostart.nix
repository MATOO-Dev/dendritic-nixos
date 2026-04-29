# {
# 	pkgs,
# 	lib,
# 	...
# }: {
# 	spawn-at-startup = [
# 		(lib.getExe pkgs.discover-overlay)
# 		(lib.getExe pkgs.hypridle)
# 		(lib.getExe pkgs.sunsetr)
# 		(lib.getExe pkgs.waybar)
# 		# (lib.getExe pkgs.kdeconnect-indicator)
# 	];
# }
{}
