{
	flake.homeModules.firefox = {
		programs.firefox.profiles.matoo.settings = {
			"general.autoScroll" = true; # enable scrolling by holding middle mouse button
			"media.eme.enabled" = true; # watch DRM content
			"media.gmp-widevinecdm.enabled" = true; # watch DRM content
			"media.videocontrols.picture-in-picture.enabled" = false; # disable picture-in-picture
			"sidebar.verticalTabs" = true; # enable vertical tabs sidebar
			"sidebar.verticalTabs.dragToPinPromo.dismissed" = true; # disable vertical tab popup
			"browser.toolbars.bookmarks.visibility" = "never"; # never show bookmarks toolbar
			"intl.accept_languages" = "en-US, en"; # prefer english pages over localized
			"browser.tabs.inTitlebar" = 0; # hide min/max/close buttons in title bar
			"browser.aboutConfig.showWarning" = false; # dont show warning when opening about:config
			"browser.newtabpage.activity-stream.showWeather" = false; # dont show weather popup on new tab
			"browser.newtabpage.activity-stream.showSponsoredTopSites" = false; # dont show sponsored links on new tabs
			"browser.ai.control.default" = "blocked"; # block the slop
			"browser.ai.control.linkPreviewKeyPoints" = "blocked"; # block the slop
			"browser.ai.control.pdfjsAltText" = "blocked"; # block the slop
			"browser.ai.control.sidebarChatbot" = "blocked"; # block the slop
			"browser.ai.control.smartTabGroups" = "blocked"; # block the slop
			"browser.ai.control.smartWindow" = "blocked"; # block the slop
			"browser.ai.control.speechRecognition" = "blocked"; # block the slop
			"browser.ai.control.translations" = "blocked"; # block the slop
		};
	};
}
