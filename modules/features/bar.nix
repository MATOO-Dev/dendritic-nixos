{
	flake.homeModules.bar = {
		programs.waybar = {
			enable = true;
			settings = {
				mainBar = {
					height = 30;
					spacing = 4;
					# define module locations
					modules-left = [
						"pulseaudio"
						"backlight"
					];
					modules-center = [
						# "hyprland/workspaces"
						"idle_inhibitor"
						"clock"
					];
					modules-right = [
						"battery"
						"power-profiles-daemon"
						"tray"
						"network"
					];
					# define module contents
					"idle_inhibitor" = {
						format = "{icon}";
						format-icons = {
							activated = "";
							deactivated = "";
						};
					};
					"tray" = {
						spacing = 10;
					};
					"clock" = {
						format = "{:%H:%M}";
						tooltip-format = "<tt><small>{calendar}</small></tt>";
						calendar = {
							weeks-pos = "left";
							mode = "month";
							mode-mon-col = 3;
							on-scroll = 1;
							format = {
								today = "<span color='$ff6699'><b><u>{}</u></b></span>";
								weekdays = "<span color='$ffcc66'><b>{}</b></span>";
								weeks = "<span color='$99ffdd'><b>{}</b></span>";
								months = "<span color='$ffead3'><b>{}</b></span>";
							};
						};
						actions = {
							on-click-right = "mode";
							on-scroll-up = "shift_up";
							on-scroll-down = "shift_down";
						};
					};
					"backlight" = {
						format = "{percent}% {icon}";
						format-icons = ["" "" "" "" "" "" "" "" ""];
					};
					"battery" = {
						states = {
							warning = 30;
							critical = 15;
						};
						format = "{capacity}% {icon}";
						format-full = "{capacity}% {icon}";
						format-charging = "{capacity}% ";
						format-plugged = "{capacity}% ";
						format-alt = "{time} {icon}";
						format-icons = ["" "" "" "" ""];
					};
					"power-profiles-daemon" = {
						format = "{icon}";
						tooltip-format = "Power profile: {profile}\nDriver: {driver}";
						tooltip = true;
						format-icons = {
							default = "";
							performance = "";
							balanced = "";
							power-saver = "";
						};
					};
					"network" = {
						format-wifi = "{essid} ({signalStrength}%) ";
						format-ethernet = "Eth ";
						tooltip-format = "{ifname} via {gwaddr} ";
						format-linked = "{ifname} (No IP) ";
						format-disconnected = "Disconnected ⚠";
						format-alt = "{ifname}: {ipaddr}/{cidr}";
					};
					"pulseaudio" = {
						on-click = "pavucontrol";
						format = "{volume}% {icon} {format_source}";
						format-muted = "  {icon} {format_source}";
						format-bluetooth = "{volume}% {icon} {format_source}";
						format-bluetooth-muted = "  {icon} {format_source}";
						format-source = "{volume}% ";
						format-source-muted = "";
						format-icons = {
							headphone = "󰋋";
							hands-free = "";
							headset = "";
							phone = "";
							portable = "";
							car = "";
							default = ["󰋋" "󰋋" "󰋋"];
						};
					};
				};
			};
		};
	};
}
