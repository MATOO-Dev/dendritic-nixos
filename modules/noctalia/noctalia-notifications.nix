{
	flake.modules.noctalia.notifications = {
		settings.notifications = {
			enabled = true;
			enableMarkdown = false;
			density = "default";
			monitors = [];
			location = "top_right";
			overlayLayer = true;
			backgroundOpacity = 0.5;
			respectExpireTimeout = true;
			lowUrgencyDuration = 3;
			normalUrgencyDuration = 8;
			criticalUrgencyDuration = 15;
			clearDismissed = true;
			saveToHistory = {
				low = true;
				normal = true;
				critical = true;
			};
			sounds = {
				enabled = false;
				volume = 0.5;
				separateSounds = false;
				criticalSoundFile = "";
				normalSoundFile = "";
				lowSoundFile = "";
				excludedApps = "discord,firefox,chrome,chromium,edge";
			};
			enableMediaToast = false;
			enableKeyboardLayoutToast = false;
			enableBatteryToast = true;
		};
	};
}
