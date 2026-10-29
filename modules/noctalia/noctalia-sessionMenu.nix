{
	flake.modules.noctalia.sessionMenu = {
		settings.sessionMenu = {
			enableCountdown = true;
			countdownDuration = 10000;
			position = "center";
			showHeader = true;
			showKeybinds = true;
			largeButtonsStyle = true;
			largeButtonsLayout = "single-row";
			powerOptions = [
				{
					action = "lock";
					command = "";
					countdownEnabled = false;
					enabled = true;
					keybind = "1";
				}
				{
					action = "suspend";
					command = "";
					countdownEnabled = true;
					enabled = false;
					keybind = "";
				}
				{
					action = "hibernate";
					command = "";
					countdownEnabled = true;
					enabled = false;
					keybind = "";
				}
				{
					action = "logout";
					command = "";
					countdownEnabled = true;
					enabled = true;
					keybind = "2";
				}
				{
					action = "reboot";
					command = "";
					countdownEnabled = true;
					enabled = true;
					keybind = "3";
				}
				{
					action = "rebootToUefi";
					command = "";
					countdownEnabled = true;
					enabled = true;
					keybind = "4";
				}
				{
					action = "shutdown";
					command = "";
					countdownEnabled = true;
					enabled = true;
					keybind = "5";
				}
				{
					action = "userspaceReboot";
					command = "";
					countdownEnabled = true;
					enabled = false;
					keybind = "";
				}
			];
		};
	};
}
