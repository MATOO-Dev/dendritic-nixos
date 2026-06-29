{
	inputs,
	self,
	...
}: {
	flake.nixosModules.matoo = {pkgs, ...}: {
		users.users.matoo = {
			isNormalUser = true;
			description = "MATOO";
			shell = pkgs.fish;
			extraGroups = [
				"networkmanager"
				"wheel"
			];
			# only used once right after installing
			# dont forget to set password after installing
			initialPassword = "12345";
		};
		programs.fish.enable = true;
	};

	flake.homeConfigurations.matoo =
		inputs.home-manager.lib.homeManagerConfiguration {
			# TODO: figure out how to set this automatically
			# may also be useful for secondary pkgs-unstable
			pkgs = import inputs.nixpkgs {system = "x86_64-linux";};
			modules = with self.homeModules; [
				bar # top bar, currently waybar
				coding # programs and settings for software development
				defaultApps # mime type associations
				email # emails
				extraPackages # packages without any category or configuration
				fastfetch # display system information
				librewolf # browser
				gaming # video games
				git # version control system
				hyprlock # lock screen
				input # input devices
				kitty # terminal
				launcher # app launcher
				matoo # user settings
				messaging # messaging apps
				music # music players
				neovim # text editor
				nix # nix settings
				notifications # notification settings
				prompt # terminal prompt
				shells # terminal shells
				snapshots # btrfs snapshots
				syncthing # sync data between devices
				theming # apply themes system-wide
				usb # external usb devices
				video # video players & editors
			];
		};

	flake.homeModules.matoo = {pkgs, ...}: {
		programs.home-manager.enable = true;

		home = {
			username = "matoo";
			homeDirectory = "/home/matoo";
			packages = with pkgs; [
				kitty
				git
			];
			stateVersion = "26.05";
		};

		# mute home manager news
		news.display = "silent";
	};
}
