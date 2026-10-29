{
	flake.modules.noctalia.onScreenDisplay = {
		settings.osd = {
			enabled = true;
			location = "top_left";
			autoHideMs = 2000;
			overlayLayer = true;
			backgroundOpacity = 0.5;
			enabledTypes = [
				0
				1
				2
			];
			monitors = [];
		};
	};
}
