{
	flake.homeModules.librewolf = {
		programs.librewolf = {
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
				Cookies.Allow = [
					"https://amazon.de"
					"https://disneyplus.com"
					"https://github.com"
					"https://netflix.com"
					"https://soundcloud.com"
					"https://typst.app"
					"https://youtube.com"
				];
			};
		};
	};
}
