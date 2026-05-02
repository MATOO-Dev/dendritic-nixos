{
    flake.modules.niri.binds =
        {
            pkgs,
            lib,
            ...
        }:
        {
            settings.binds = {
                ################
                ## show binds ##
                ################
                "Mod+Shift+Slash".show-hotkey-overlay = _: { };

                ##################
                ## run programs ##
                ##################
                "Mod+Q" = _: {
					props.hotkey-overlay-title = "Open Terminal: kitty";
					content.spawn = lib.getExe pkgs.kitty;
				};
                "Mod+R" = _:{
					props.hotkey-overlay-title = "Run app launcher: rofi";
					content.spawn = [
						"${lib.getExe pkgs.rofi}"
						"-show"
						"drun"
					];
				};
                "Mod+N" = _: {
					props.hotkey-overlay-title = "Open file manager: dolphin";
					content.spawn = lib.getExe pkgs.kdePackages.dolphin;
				};
                "Mod+Pause" = _:{
					props.hotkey-overlay-title = "Save replay; gpu screen recorder";
					# this may need getExe gsr replaced with just gsr
					content.spawn-sh = ''
						killall -SIGUSR1
						${lib.getExe pkgs.gpu-screen-recorder}
						&& sleep 0.5
						&& notify-send -t 1550 -u low --
						\"GPU Screen Recorder\" \"Replay saved\"
					'';
				};
                "Ctrl+Shift+Escape" = _:{
					props.hotkey-overlay-title = "Launch process manager: mission center";
					content.spawn = lib.getExe pkgs.mission-center;
				};
                "Alt+Z" = _:{
					props.hotkey-overlay-title = "Open UI: gpu screen recorder";
					content.spawn-sh = ''
						SECONDS=0
						while [[ 2 -gt $SECONDS ]]; do
						if niri msg windows | grep 'App ID: "gsr-ui"' > /dev/null; then
							niri msg action move-window-to-floating
							niri msg action set-window-width 2560
							niri msg action set-window-height 1440
							exit
						fi
						done
					'';
				};

                #################
                ## screenshots ##
                #################
                "Print".screenshot = _: { };
                "Ctrl+Print".screenshot-screen = _: { };
                "Alt+Print".screenshot-window = _: { };

                #################
                ## lock / exit ##
                #################
                "Super+Alt+L" = _:{
					props.hotkey-overlay-title = "Lock the screen: hyprlock";
					content.spawn = lib.getExe pkgs.hyprlock;
				};
                "Mod+Shift+E".quit = _: { };

                ########################
                ## hardware functions ##
                ########################
                "XF86MonBrightnessUp" = _:{
					props.allow-when-locked = true;
					content.spawn = [
						"${lib.getExe pkgs.brightnessctl}"
						"--class=backlight"
						"set"
						"+10%"
					];
				};
                "XF86MonBrightnessDown" = _:{
					props.allow-when-locked = true;
					content.spawn = [
						"${lib.getExe pkgs.brightnessctl}"
						"--class=backlight"
						"set"
						"-10%"
					];
				};

                #####################
                ## window controls ##
                #####################
                "Mod+O" = _: {
					props.repeat = false;
					content.toggle-overview = _: { };
				};
                "Mod+C" = _: {
					props.repeat = false;
					content.close-window = _: { };
				};
                "Mod+Shift+F".fullscreen-window = _: { };
                "Mod+V".toggle-window-floating = _: { };

                #####################
                ## column controls ##
                #####################
                "Mod+BracketLeft".consume-or-expel-window-left = _: { };
                "Mod+BracketRight".consume-or-expel-window-right = _: { };
                "Mod+Comma".consume-window-into-column = _: { };
                "Mod+Period".expel-window-from-column = _: { };
                "Mod+T".switch-preset-column-width = _: { };
                "Mod+F".maximize-column = _: { };
                "Mod+Ctrl+F".expand-column-to-available-width = _: { };
                "Mod+Shift+C".center-column = _: { };
                "Mod+Ctrl+C".center-visible-columns = _: { };
                "Mod+W".toggle-column-tabbed-display = _: { };

                ##########################
                ## move through columns ##
                ##########################
                "Mod+H".focus-column-left = _: { };
                "Mod+L".focus-column-right = _: { };

                #########################
                ## move columns around ##
                #########################
                "Mod+Shift+H".move-column-left = _: { };
                "Mod+Shift+L".move-column-right = _: { };

                #############################
                ## move through workspaces ##
                #############################
                "Mod+J" = _: {
					props.cooldown-ms = 150;
					content.focus-workspace-down = _: { };
				};
                "Mod+K" = _: {
					props.cooldown-ms = 150;
					content.focus-workspace-up = _: { };
				};

                ##############################
                ## move column to workspace ##
                ##############################
                "Mod+Shift+J" = _: {
					props.cooldown-ms = 150;
					content.move-column-to-workspace-down = _:{};
				};
                "Mod+Shift+K" = _: {
					props.cooldown-ms = 150;
					content.move-column-to-workspace-up = _:{};
				};
            };
        };
}
