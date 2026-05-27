{
	flake.homeModules.hyprlock = {
		services.hypridle = {
			enable = true;
			settings = {
				general = {
					lock_cmd = "pidof hyprlock || hyprlock";
					before_sleep_cmd = "loginctl lock-session";
					after_sleep_cmd = "hyprctl dispatch dpms on";
				};
				listener = [
					{
						# lock after 5 minutes
						timeout = 300;
						on-timeout = "loginctl lock-session";
					}
					{
						# turn display off after 10 minues
						timeout = 600;
						on-timeout = "hyprctl dispatch dpms off";
						on-resume = "hyprctl dispatch dpms on";
					}
				];
			};
		};

		programs.hyprlock = {
			enable = true;
			settings = {
				general = {
					grace = 1;
					hide_cursor = true;
					ignore_empty_input = true;
				};
				background = {
					blur_size = 5;
					blur_passes = 1;
					noise = 0.0177;
					contract = 1.3000;
					brightness = 0.8000;
					vibrancy = 0.2100;
					vibrancy_darkness = 0.0;
				};
				label = {
					text = "MATOO";
					font_size = 25;
					position = "0, 155";
				};
				input-field = {
					size = "300, 50";
					outline_thickness = 3;
					dots_size = 0.33;
					dots_spacing = 0.15;
					dots_center = true;
					outer_color = "rgba(0,0,0,1)";
					inner_color = "rgba(255,255,255,1)";
					font_color = "rgba(0,100,255,1)";
					fade_on_empty = false;
					placeholder_text = "<i>password...</i>";
					hide_input = false;
					position = "0, 100";
					halign = "center";
					valign = "center";
				};
			};
		};
	};
}
