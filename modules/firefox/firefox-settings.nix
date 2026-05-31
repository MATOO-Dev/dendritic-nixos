{
	flake.homeModules.firefox = {
		programs.firefox.profiles.matoo.settings = {
			"media.eme.enabled" = true; # watch DRM content
			"media.gmp-widevinecdm.enabled" = true; # watch DRM content
			"media.videocontrols.picture-in-picture.enabled" = false; # disable picture-in-picture
		};
	};
}
