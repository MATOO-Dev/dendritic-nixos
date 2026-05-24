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
				bar
				coding
				defaultApps
				email
				extraPackages
				firefox
				git
				input
				kitty
				matoo
				messaging
				neovim
				nix
				prompt
				recording
				search
				shells
				snapshots
				syncthing
				theming
				usb
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

		# mut home manager news
		news.display = "silent";
	};
}
