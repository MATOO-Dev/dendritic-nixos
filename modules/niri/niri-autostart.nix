{
	flake.modules.niri.autostart = {
		pkgs,
		lib,
		...
	}: let
		niri-tweaks =
			pkgs.fetchFromGitHub {
				owner = "heyoeyo";
				repo = "niri_tweaks";
				rev = "b9a8eca759f0788959cdcfa3ed2f49e7ce077e8b";
				hash = "sha256-Tqg1lAcltrQAflap4Q0RMyYEQfO6TbSAuuOT93yzW7I=";
			};
		niri-tile-to-n =
			pkgs.writeShellApplication {
				name = "niri-tile-to-n";
				runtimeInputs = [pkgs.python3];
				text = ''
					# tile the first 2 windows, then scroll
					exec python3 ${niri-tweaks}/niri_tile_to_n.py -n 2
				'';
			};
	in {
		settings.spawn-at-startup = [
			["${niri-tile-to-n}/bin/niri-tile-to-n"]
			(lib.getExe pkgs.discover-overlay)
			(lib.getExe pkgs.hypridle)
			(lib.getExe pkgs.sunsetr)
			(lib.getExe pkgs.waybar)
			# (lib.getExe pkgs.kdeconnect-indicator)
			(lib.getExe (
					pkgs.writeShellApplication {
						name = "set-wallpaper";
						runtimeInputs = with pkgs; [swaybg];
						text = ''swaybg -m fill -i ~/Pictures/Wallpapers/background.jpg'';
					}
				))
		];
	};
}
