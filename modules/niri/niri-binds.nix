# {
# 	pkgs,
# 	lib,
# 	...
# }: {
# 	binds = {
# 		################
# 		## show binds ##
# 		################
# 		"Mod.Shift.Slash".show-hotkey-overlay = null;
#
# 		##################
# 		## run programs ##
# 		##################
# 		"Mod+Q".spawn-sh = lib.getExe pkgs.kitty;
# 		"Mod+R".spawn-sh = [lib.getExe pkgs.rofi "-show" "drun"];
# 		"Mod+N".spawn-sh = lib.getExe pkgs.kdePackages.dolphin;
# 		"Mod+Pause".spawn-sh = [
# 			"killall -SIGUSR1"
# 			lib.getExe
# 			pkgs.gpu-screen-recorder
# 			"&& sleep 0.5"
# 			"&& notify-send -t 1550 -u low"
# 			''"GPU Screen Recorder" "Replay saved"''
# 		];
# 		"Ctrl+Shift+Escape".spawn-sh = lib.getExe pkgs.mission-center;
# 		"Alt+Z".spawn-sh = ''
# 			SECONDS=0
# 			while [[ 2 -gt $SECONDS ]]; do
# 			if niri msg windows | grep 'App ID: "gsr-ui"' > /dev/null; then
# 				niri msg action move-window-to-floating
# 				niri msg action set-window-width 2560
# 				niri msg action set-window-height 1440
# 				exit
# 			fi
# 			done
# 		'';
#
# 		#################
# 		## screenshots ##
# 		#################
# 		"Print".screenshot = null;
# 		"Ctrl+Print".screenshot-screen = null;
# 		"Alt+Print".screenshot-window = null;
#
# 		#################
# 		## lock / exit ##
# 		#################
# 		"Super+Alt+L".spawn-sh = lib.getExe pkgs.hyprlock;
# 		"Mod+Shift+E".quit = null;
# 		"Ctrl+Alt+Delete".quit = null;
#
# 		########################
# 		## hardware functions ##
# 		########################
# 		# these 2 should have allow-when-locked=true
# 		"XF86MonBrightnessUp".spawn = [lib.getExe pkgs.brightnessctl "--class=backlight" "set" "+10%"];
# 		"XF86MonBrightnessDown".spawn = [lib.getExe pkgs.brightnessctl "--class=backlight" "set" "-10%"];
#
# 		#####################
# 		## window controls ##
# 		#####################
# 		"Mod+O".toggle-overview = null; # should have repeat = false
# 		"Mod+C".close-window = null; # should have repeat = false
# 		"Mod+Shift+F".fullscreen-window = null;
# 		"Mod+V".toggle-window-floating = null;
#
# 		#####################
# 		## column controls ##
# 		#####################
# 		"Mod+BracketLeft".consume-or-expel-window-left = null;
# 		"Mod+BracketRight".consume-or-expel-window-right = null;
# 		"Mod+Comma".consume-window-into-column = null;
# 		"Mod+Period".expel-window-from-column = null;
# 		"Mod+T".switch-preset-column-width = null;
# 		"Mod+F".maximize-column = null;
# 		"Mod+Ctrl+F".expand-column-to-available-width = null;
# 		"Mod+Shift+C".center-column = null;
# 		"Mod+Ctrl+C".center-visible-columns = null;
# 		"Mod+W".toggle-column-tabbed-display = null;
#
# 		##########################
# 		## move through columns ##
# 		##########################
# 		"Mod+H".focus-column-left = null;
# 		"Mod+L".focus-column-right = null;
#
# 		#########################
# 		## move columns around ##
# 		#########################
# 		"Mod+Shift+H".move-column-left = null;
# 		"Mod+Shift+J".move-column-down = null;
# 		"Mod+Shift+K".move-column-up = null;
# 		"Mod+Shift+L".move-column-right = null;
#
# 		#############################
# 		## move through workspaces ##
# 		#############################
# 		"Mod+J".focus-workspace-down = null; # should have cooldown-ms=150
# 		"Mod+K".focus-workspace-up = null; # should have cooldown-ms=150
#
# 		##############################
# 		## move column to workspace ##
# 		##############################
# 		# "Mod+Ctrl+WheelScrollDown".move-column-to-workspace-down = null; # should have cooldown-ms=150
# 		# "Mod+Ctrl+WheelScrollUp".move-column-to-workspace-Up = null; # should have cooldown-ms=150
# 	};
# }
{
}
