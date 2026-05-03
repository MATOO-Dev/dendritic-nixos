{
	flake.modules.niri.monitors = {
		settings.outputs = {
			"DP-2" = {
				mode = "2560x1440";
				scale = 1.2;
				position = _: { props.x = 0; props.y = 0; };
				variable-refresh-rate = _: {};
				focus-at-startup = _: {};
				hot-corners = _: { off = _: {}; };
			};

			"DP-3" = {
				mode = "2560x1440";
				scale = 1.2;
				# position uses logical, scaled pixels instead of physical pixels
				# therefore, offset is resolution / scale
				position = _: { props.x = -2133; props.y = 0; };
				variable-refresh-rate = _: {};
				hot-corners = _: { off = _: {}; };
			};

			"eDP-1" = {
				# TODO: check if resolution is correct
				# might also be 2880 x 1920, but unlikely
				mode = "2256x1504";
				scale = 1.75;
				variable-refresh-rate = _: {};
				hot-corners = _: { off = _: {}; };
			};
		};
	};
}
