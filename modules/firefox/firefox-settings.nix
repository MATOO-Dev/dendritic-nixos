{
	flake.homeModules.firefox = {
		programs.firefox.profiles.matoo.settings = {
			"media.eme.enabled" = true;
			"media.gmp-widevinecdm.enabled" = true;
		};
	};
}
