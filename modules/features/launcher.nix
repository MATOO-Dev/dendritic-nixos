{
	flake.homeModules.launcher = {lib, ...}: {
		programs.rofi = {
			enable = true;
			modes = [
				"drun"
			];
		};

		programs.vicinae = {
			enable = true;
			settings = {
				favorites = [];
				fallbacks = [];
				close_on_focus_loss = false;
				launcher_window = {
					opacity = lib.mkForce 0.85;
					blur.enabled = true;
					client_side_decorations.enabled = false;
				};
				keybinds = {
					toggle-action-panel = "shift+RETURN";
				};
				telemetry.system_info = false;
				providers = {
					applications.preferences.defaultAction = "launch";
					# category settings
					browser-extension.entrypoints.shortcut-active-tab.enabled = false;
					clipboard.preferences = {
						encryption = true;
						eraseOnStartup = false;
						ignorePasswords = true;
						monitoring = true;
					};
					files.preferences.excludedPaths = "/home/matoo/Videos";
					# disabled .desktop files
					entrypoints = {
						btop.enabled = false;
						cups.enabled = false;
						kvantummanager.enabled = false;
						org.kde.ark.enabled = false;
						qt5ct.enabled = false;
						qt6ct.enabled = false;
						rofi-theme-selector.enabled = false;
						scrcpy-console.enabled = false;
						xterm.enabled = false;
					};
					# disabled categories
					core.entrypoints = {
						about.enabled = false;
						keybind-settings.enabled = false;
						list-extensions.enabled = false;
						manage-fallback.enabled = false;
						oauth-token-store.enabled = false;
						open-config-file.enabled = false;
						open-default-config.enabled = false;
						prune-memory.enabled = false;
						refresh-apps.enabled = false;
						reload-scripts.enabled = false;
						report-bug.enabled = false;
						search-builtin-icons.enabled = false;
						settings.enabled = false;
						sponsor.enabled = false;
					};
					developer.enabled = false;
					font.enabled = false;
					manage-shortcuts.enabled = false;
					power.entrypoints = {
						hibernate.enabled = false;
						lock.enabled = false;
						sleep.enabled = false;
						soft-reboot.enabled = false;
						suspend.enabled = false;
					};
					raycast-compat.enabled = false;
					snippets.enabled = false;
					system.entrypoints = {
						toggle-mute.enabled = false;
						volume-0.enabled = false;
						volume-100.enabled = false;
						volume-25.enabled = false;
						volume-50.enabled = false;
						volume-75.enabled = false;
						volume-down.enabled = false;
						volume-up.enabled = false;
					};
					theme.enabled = false;
					wm.enabled = false;
				};
			};
		};
	};
}
