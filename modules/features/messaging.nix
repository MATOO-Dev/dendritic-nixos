{inputs, ...}: {
	flake.nixosModules.messaging = {
		# TODO: signal might need some ports opened?
	};

	flake.homeModules.messaging = {pkgs, ...}: {
		home.packages = with pkgs; [
			signal-desktop
			zapzap
		];

		imports = [inputs.nixcord.homeModules.nixcord];
		programs.nixcord = {
			enable = true;
			discord.vencord.enable = true;
			vesktop.enable = false;
			config.plugins = {
				ClearURLs.enable = true; # remove tracking parameters
				gameActivityToggle.enable = true; # button to toggle activity
				noMiddleClickPaste.enable = true; # disable MB3 paste buffer
				# NoTrack.enable = true; # disable analytics
				stickerPaste.enable = true; # stickers go to chatbox instead of sending
				volumeBooster.enable = true; # boost max volume
			};
		};
	};
}
