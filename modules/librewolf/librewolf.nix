{self, ...}: {
	flake.homeModules.librewolf = {
		programs.librewolf = {
			enable = true;
			languagePacks = ["en-US"];
		};
	};

	# flake.homeModules.firefox = {
	# 	modules = with self.modules.firefox; [
	# 		addons
	# 		general
	# 		policies
	# 		profiles
	# 	];
	# };
}
