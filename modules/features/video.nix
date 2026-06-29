{
	flake.homeModules.video = {pkgs, ...}: {
		home.packages = with pkgs; [
			footage # trimmer
			kdePackages.kdenlive # editor
			vlc # player
			yt-dlg # download graphically
			yt-dlp # download from cli
			# player + plugins
			(mpv.override {
					scripts = with mpvScripts; [
						cut
					];
				})
		];

		# programs.mpv = {
		# 	enable = true;
		#
		# 	package = (
		# 		pkgs.mpv-unwrapped.wrapper {
		# 			scripts = with pkgs.mpvScripts; [
		# 				cut
		# 			];
		#
		# 			mpv =
		# 				pkgs.mpv-unwrapped.override {
		# 					waylandSupport = true;
		# 				};
		# 		}
		# 	);
		#
		# 	config = {
		# 		profile = "high-quality";
		# 		ytdl-format = "bestvideo+bestaudio";
		# 		cache-default = 4000000;
		# 	};
		# };
	};
}
