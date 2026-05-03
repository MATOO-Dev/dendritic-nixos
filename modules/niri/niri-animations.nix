{
	flake.modules.niri.animations = {
		settings.animations = {
			# TODO: port remaining animations from hyprland config
			window-open = {
				curve = [
					"cubic-bezier"
					0.23
					1
					0.32
					1
				];
			};
		};
	};
}
