{
	flake.nixosModules.matoo = {
		users.users.matoo = {
			isNormalUser = true;
			description = "MATOO";
			extraGroups = [
				"networkmanager"
				"wheel"
			];
			# only used once right after installing
			# dont forget to set password after installing
			initialPassword = "12345";
		};
	};

	flake.homeConfigurations.matoo = {
		inputs,
		self,
		pkgs,
		...
	}:
		inputs.home-manager.lib.homeManagerConfiguration {
			modules = with self.homeModules; [
				bar
				coding
				defaultApps
				discord
				email
				extraPackages
				firefox
				git
				hyprland
				kitty
				neovim
				niri
				nix
				prompt
				recording
				search
				shells
				snapshots
				syncthing
				theming
			];

			programs.home-manager.enable = true;

			home = {
				username = "matoo";
				homeDirectory = "/home/matoo";
				packages = with pkgs; [
					kitty
					git
				];
				stateVersion = "25.11";

				# mut home manager news
				news.display = "silent";
			};
		};
}
