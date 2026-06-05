{
	flake.homeModules.firefox = {
		programs.firefox.profiles.matoo.settings = {
			"browser.aboutConfig.showWarning" = false; # disable warning when opening about:config
			"browser.translations.automaticallyPopup" = false; # disable translation popup
			"media.eme.enabled" = true; # watch DRM content
			"media.gmp-widevinecdm.enabled" = true; # watch DRM content
			"media.videocontrols.picture-in-picture.enabled" = false; # disable picture-in-picture
			"sidebar.verticalTabs" = true; # enable vertical tabs sidebar
		};
	};
}
