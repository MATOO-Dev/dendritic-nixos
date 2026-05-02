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
                "Mod+Q".spawn-sh = lib.getExe pkgs.kitty;
                # "Mod+R".spawn-sh = [
                #     lib.getExe
                #     pkgs.rofi
                #     "-show"
                #     "drun"
                # ];
                "Mod+N".spawn-sh = lib.getExe pkgs.kdePackages.dolphin;
                # "Mod+Pause".spawn-sh = [
                #     "killall -SIGUSR1"
                #     lib.getExe
                #     pkgs.gpu-screen-recorder
                #     "&& sleep 0.5"
                #     "&& notify-send -t 1550 -u low"
                #     ''"GPU Screen Recorder" "Replay saved"''
                # ];
                "Ctrl+Shift+Escape".spawn-sh = lib.getExe pkgs.mission-center;
                # "Alt+Z".spawn-sh = ''
                #     			SECONDS=0
                #     			while [[ 2 -gt $SECONDS ]]; do
                #     			if niri msg windows | grep 'App ID: "gsr-ui"' > /dev/null; then
                #     				niri msg action move-window-to-floating
                #     				niri msg action set-window-width 2560
                #     				niri msg action set-window-height 1440
                #     				exit
                #     			fi
                #     			done
                #     		'';

                #################
                ## screenshots ##
                #################
                "Print".screenshot = _: { };
                "Ctrl+Print".screenshot-screen = _: { };
                "Alt+Print".screenshot-window = _: { };

                #################
                ## lock / exit ##
                #################
                "Super+Alt+L".spawn-sh = lib.getExe pkgs.hyprlock;
                "Mod+Shift+E".quit = _: { };
                "Ctrl+Alt+Delete".quit = _: { };

                ########################
                ## hardware functions ##
                ########################
                # these 2 should have allow-when-locked=true
                # "XF86MonBrightnessUp".spawn = [
                #     lib.getExe
                #     pkgs.brightnessctl
                #     "--class=backlight"
                #     "set"
                #     "+10%"
                # ];
                # "XF86MonBrightnessDown".spawn = [
                #     lib.getExe
                #     pkgs.brightnessctl
                #     "--class=backlight"
                #     "set"
                #     "-10%"
                # ];

                #####################
                ## window controls ##
                #####################
                # repeat strat: see saved image
                "Mod+O".toggle-overview = _: { }; # should have repeat = false
                "Mod+C".close-window = _: { }; # should have repeat = false
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
                # "Mod+Shift+J".move-column-down = _: { };
                # "Mod+Shift+K".move-column-up = _: { };
                "Mod+Shift+L".move-column-right = _: { };

                #############################
                ## move through workspaces ##
                #############################
                "Mod+J".focus-workspace-down = _: { }; # should have cooldown-ms=150
                "Mod+K".focus-workspace-up = _: { }; # should have cooldown-ms=150

                ##############################
                ## move column to workspace ##
                ##############################
                # "Mod+Ctrl+WheelScrollDown".move-column-to-workspace-down = _:{}; # should have cooldown-ms=150
                # "Mod+Ctrl+WheelScrollUp".move-column-to-workspace-Up = _:{}; # should have cooldown-ms=150
            };
        };
}
