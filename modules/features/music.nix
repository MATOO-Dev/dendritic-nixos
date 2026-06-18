{inputs, ...}: {
	flake.homeModules.music = {pkgs, ...}: {
		imports = [inputs.spicetify-nix.homeManagerModules.default];

		programs.spicetify = let
			spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
		in {
			enable = true;
			enabledExtensions = with spicePkgs.extensions; [
				adblock # remove ads
				autoVolume # adjust volume after a while to save ears
				bestMoment # select & listen to a specific section
				hidePodcasts # remove podcasts
				keyboardShortcut # vimium-like keybinds
				seekSong # seek like youtube
				showQueueDuration # show duration of queued songs
				shuffle # different shuffling algorithm
				volumePercentage # show volume percentage next to slider
			];
		};
	};
}
