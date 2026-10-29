{
	flake.modules.noctalia.calendar = {
		settings.calendar = {
			cards = [
				{
					enabled = true;
					id = "calendar-header-card";
				}
				{
					enabled = true;
					id = "calendar-month-card";
				}
				{
					enabled = false;
					id = "weather-card";
				}
			];
		};
	};
}
