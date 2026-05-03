{
	flake.modules.niri.layout = {
		settings = {
			# ask windows to disable client side decorations
			# also tells them that they are tiled (if supported)
			# TODO: Figure out syntax
			# perfer-no-csd = _: {};

			overview = {
				zoom = 0.9;
				# backdrop-color = "#777777";
			};

			layout = {
				# in logical pixels
				# drawn on each side
				gaps = 10;

				# offset on each side
				# negative values means reverting the gaps
				# this leaves gaps only between windows
				# make this smaller than gaps so the focus ring has space
				struts = {
					left = -5;
					right = -5;
					top = -5;
					bottom = -5;
				};

				center-focused-column = "never";
				# always-center-single-column = _: {};

				preset-column-widths = [
					{ proportion = 0.33333; }
					{ proportion = 0.5; }
					{ proportion = 0.66667; }
					{ proportion = 1.0; }
				];

				default-column-width = {
					proportion = 0.5;
				};

				focus-ring = {
					width = 3;
					active-gradient = _: {
						props.from = "#33ccffee";
						props.to = "#00ff99ee";
						props.angle = 135;
					};
					inactive-color = "#595959aa";
				};

				shadow = {
					on = _: {};
					spread = 4;
					softness = 3;
					offset = _: { props.x = 0; props.y = 5; };
					color = "#1a1a1aee";
					draw-behind-window = true;
				};
			};
		};
	};
}
