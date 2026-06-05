{
	flake.homeModules.librewolf = {
		programs.librewolf.profiles.matoo.settings = {
			"browser.aboutConfig.showWarning" = false; # disable warning when opening about:config
			"browser.ai.control.default" = "blocked"; # block ai slop
			"browser.contentblocking.category" = "strict"; # strict tracking protection
			"browser.newtabpage.activity-stream.showSponsored" = false; # disable ads
			"browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false; # disable ads
			"browser.newtabpage.activity-stream.showSponsoredTopSites" = false; # disable ads
			"browser.translations.automaticallyPopup" = false; # disable translation popup
			"generall.autoScroll" = true; # enable scrolling by holding middle mouse button
			"media.eme.enabled" = true; # watch DRM content
			"media.gmp-widevinecdm.enabled" = true; # watch DRM content
			"media.videocontrols.picture-in-picture.enabled" = false; # disable picture-in-picture
			"sidebar.verticalTabs" = true; # enable vertical tabs sidebar
			"sidebar.verticalTabs.dragToPinPromo.dismissed" = true; # disable popup in sidebar
		};
	};
}
