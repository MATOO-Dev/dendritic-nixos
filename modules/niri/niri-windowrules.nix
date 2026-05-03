{
	flake.modules.niri.windowrules = {
		settings.layer-rules = [
			# block notifications from screenshare
			{
				matches = [{ namespace = "^notifications$"; }];
				block-out-from = "screen-capture";
			}
		];

		settings.window-rules = [
			# general rules for all windows
			{
				# rounded corners
				geometry-corner-radius = 10;
				# disable / cut off client side shadows etc
				clip-to-geometry = true;
			}

			# float these windows in the center
			{
				matches = [
					# gtodot games launched from editor
					{ title = ".+ (DEBUG)"; }
					# gpu screen recorder ui
					{ app-id = "gsr-ui"; }
					# learnopengl projects
					{ title = "LearnOpenGL"; }
					# uni computer graphics projects
					{ title = ".* -  (.* fps)"; }
				];
				open-floating = true;
				open-fullscreen = false;
			}

			# gsr-ui refuses to float by itself, see corresponding script in binds.kdl
			{
				matches = [{ app-id = "gsr-ui"; }];
				open-floating = true;
				geometry-corner-radius = 0;
				focus-ring = { off = _: {}; };
				default-floating-position = _: {
					props = {
						x = 0;
						y = -35;
						relative-to = "top-left";
					};
				};
			}

			# float these windows in the center
			# change default column width for these windows to 1
			{
				matches = [
					# main steam window
					{ app-id = "steam"; title = "Steam"; }
					# main godot editor window
					{ app-id = "Godot"; title = ".*GodotEngine"; }
					# videos
					{ app-id = "vlc"; }
					# discord
					{ app-id = "discord"; }
				];
				default-column-width = { proportion = 1.0; };
				default-window-height = { proportion = 1.0; };
			}

			# float, disable rounding and focus ring border for these windows
			{
				matches = [
					# kruler
					{ app-id = "org.kde.kruler"; }
					# firefox picture in picture
					{ app-id = "firefox"; title = "Picture-in-Picture"; }
					# uni exercise outputs
					{ app-id = ".*-Exercise-.*"; }
				];
				open-floating = true;
				geometry-corner-radius = 0;
				focus-ring = { off = _: {}; };
			}

			# fullscreen these windows
			{
				matches = [{ app-id = "Minecraft"; }];
				open-fullscreen = true;
			}

			# tile these float-by-default windows
			{
				matches = [
					# steam friends list
					{ app-id = "steam"; title = "Friends List"; }
					# steam startup popup
					{ app-id = "steam"; title = "Sign in to Steam"; }
					# steam shutdown popup
					{ app-id = "steam"; title = "Shutdown"; }
					# discord updating popup
					{ app-id = "steam"; title = "Discord Updater"; }
				];
				open-floating = false;
				default-window-height = { proportion = 1.0; };
			}

			# place these popups in the top right corner
			{
				matches = [
					# gpu screen recorder popup
					{ title = "gsr notify"; }
					# steam notifications & now playing popups
					{ app-id = "steam"; title = "notificationtoasts_\\d+desktop"; }
				];
				open-focused = false;
				default-floating-position = _: {
					props = {
						x = -65;
						y = 10;
						relative-to = "top-right";
					};
				};
			}

			# make urgent popups floating with red-orange border
			{
				matches = [{ is-urgent = true; }];
				open-floating = true;
				open-focused = true;
				focus-ring = {
					active-gradient = _: {
						props.from = "#FF0000FF";
						props.to = "#FF7700FF";
						props.angle = 135;
					};
				};
			}

			# # blur (future, testing)
			# {
			# 	matches = [
			# 		{ app-id = "kitty"; }
			# 		{ app-id = "org.gnome.Nautilus"; }
			# 	];
			# 	background_effect = { blur = true; };
			# }
		];
	};
}
