{}
# {
# 	flake.homeModules.kitty = {
# 		programs.kitty = {
# 			enable = true;
#
# 			shellIntegration = {
# 				enableBashIntegration = true;
# 				enableZshIntegration = true;
# 				enableFishIntegration = true;
# 				mode = "no-cursor";
# 			};
#
# 			# only works if font name is also set
# 			# font.size = 11;
# 			# try these at some point
# 			# font = "ttf-iosevka-ss02";
# 			# emoji-font = "noto-fonts-emoji";
#
# 			keybindings = {
# 				"cmd+plus" = "change_font_size all +1.0";
# 				"cmd+equal" = "change_font_size all +1.0";
# 				"cmd+minus" = "change_font_size all -1.0";
# 				"cmd+shift+minus" = "change_font_size all -1.0";
# 			};
#
# 			settings = {
# 				disable_ligatures = "always";
# 				scrollback_lines = 1000;
# 				enable_audio_bell = "no";
# 				cursor_shape = "block";
# 				confirm_os_window_close = 1;
# 				sync_to_monitor = "yes";
# 				background_opacity = 0.9;
# 				background_blur = 1;
# 			};
#
# 			themeFile = "Catppuccin-Macchiato";
# 		};
# 	};
# }

