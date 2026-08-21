{
	# TODO: finish, then include in home
	flake.homeModules.anki = {pkgs, ...}: {
		programs.anki = {
			enable = true;
			language = "en_US";
			# TODO: port personal settings
			# semi-blocked by SOPS integration for sync credentials
			profiles.default = {
			};
			addons = with pkgs.ankiAddons; [
				passfail2
				review-heatmap.withConfig
				{
					# TODO: port plugin config
					config = {
						color_theme = "lime";
						display_mode = "continuous";
						calendar_start_day = 1;
						exclude_manual_reschedules = true;
						ignore_data_before = 1686730400;
						# ignore data before 14.08.2026

						colors = "lime";
						limcdel = false;
						limdate = 1786730400;
						limdecks = [];
						limfcst = 0;
						limhist = 0;
						limresched = true;
						mode = "months";
					};
				}
			];
		};
	};
}
