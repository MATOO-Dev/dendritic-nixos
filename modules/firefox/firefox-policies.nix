{
	flake.homeModules.firefox = {
		programs.firefox = {
			policies = {
				AppAutoUpdate = false;
				BackgroundAppUpdate = false;
				DefaultDownloadDIrectory = "\${home}/Downloads";
				DisableFirefoxStudies = true;
				DisablePasswordReveal = true;
				DisableTelemetry = true;
				DisplayMenuBar = "never";
				DontCheckDefaultBrowser = true;
				HardwareAcceleration = true;
				Homepage.StartPage = "previous-session";
				OfferToSaveLogins = false;
			};
		};
	};
}
