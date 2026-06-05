{
	flake.homeModules.librewolf = {
		programs.librewolf.profiles.matoo.settings = {
			"general.autoScroll" = true; # enable scrolling by holding middle mouse button
			"media.eme.enabled" = true; # watch DRM content
			"media.gmp-widevinecdm.enabled" = true; # watch DRM content
			"media.videocontrols.picture-in-picture.enabled" = false; # disable picture-in-picture
			"sidebar.verticalTabs" = true; # enable vertical tabs sidebar
		};
	};
}
