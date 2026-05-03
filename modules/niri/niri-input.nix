{
	flake.modules.niri.input = {
		settings = {
			input = {
				keyboard.xkb.layout = "eu";

				warp-mouse-to-focus = _: {};

				focus-follows-mouse = _: {
					# this may need to be props
					props.max-scroll-amount = "0%";
				};

				mouse.accel-profile = "flat";

				touchpad.tap = _: {};
				touchpad.accel-profile = "flat";
			};

			cursor = {
				xcursor-size = 24;
				# hide-when-typing = _: {};
				# hide-after-inactive-ms = 0;
			};
		};
	};
}
