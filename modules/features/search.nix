{
	flake.homeModules.search = {
		programs.rofi = {
			enable = true;
			modes = [
				"drun"
			];
		};

		programs.vicinae = {
			enable = true;
			settings = {
				telemetry.system_info = false;
			};
		};
	};
}
