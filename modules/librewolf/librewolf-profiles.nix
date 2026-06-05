{
	flake.homeModules.librewolf = {
		programs.librewolf.profiles.matoo = {
			settings."browser.engagement.home-button.has-used" = true;
			settings."browser.uiCustomization.state" =
				builtins.toJSON {
					placements = {
						# TODO: remove 'home page button'
						# TODO: remove empty spaces
						# TODO: sidebar button should be first, but isnt
						"nav-bar" = [
							"sidebar-button"
							"back-button"
							"forward-button"
							"urlbar-container"
							"downloads-button"
							"library-button"
							"78272b6fa58f4a1abaac99321d503a20@proton.me-browser-action" # proton pass
							"{d7742d87-e61d-4b78-b8a1-b469842139fa}-browser-action" # vimium
							"uMatrix@raymondhill.net-browser-action" # uMatrix
							"unified-extensions-button"
							"PanelUI-menu-button"
						];
					};
				};
		};
	};
}
