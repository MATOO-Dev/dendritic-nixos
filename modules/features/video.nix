{
	flake.homeModules.video = {pkgs, ...}: {
		home.packages = let
			mpv-replace =
				pkgs.writeShellApplication {
					name = "mpv-replace";
					runtimeInputs = with pkgs; [mpv socat];
					text = ''
						SOCKET="/run/user/$(id -u)/mpv-socket"
						if [ -S "$SOCKET" ]; then
							printf '{"command":["loadfile","%s","replace"]}\n' "$1" | socat - "$SOCKET"
						else
							mpv --input-ipc-server="$SOCKET" "$@"
						fi
					'';
				};
		in
			with pkgs; [
				footage # trimmer
				kdePackages.kdenlive # editor
				vlc # player
				yt-dlg # download graphically
				yt-dlp # download from cli
				mpv-replace
			];

		programs.mpv = {
			enable = true;

			scripts = with pkgs.mpvScripts; [
				cut
			];

			config = {
				idle = "no";
				keep-open = "always";
				profile = "gpu-hq";
				save-position-on-quit = "no";
				ytdl-format = "bestvideo+bestaudio";
				# cache-default = 4000000;
			};
		};

		# xdg.desktopEntries.mpv-replace = {
		# 	name = "mpv-replace";
		# 	exec = "mpv --input-ipc-server=/tmp/mpv.sock %U";
		# 	mimeType = [
		# 		"video/mp4"
		# 		"video/x-matroska"
		# 		"video/webm"
		# 		"video/quicktime"
		# 	];
		# };
	};
}
