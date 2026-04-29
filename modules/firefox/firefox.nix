{
	flake.nixosModules.firefox = {
		environment.sessionVariables.MOZ_ENABLE_WAYLAND = 1;
	};

	flake.homeModules.firefox = {
		programs.firefox = {
			enable = true;
			languagePacks = ["en-US"];

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
