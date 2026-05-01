{ inputs, self, ... }:
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

    flake.homeConfigurations.matoo = inputs.home-manager.lib.homeManagerConfiguration {
		# TODO: figure out how to set this automatically
		# may also be useful for secondary pkgs-unstable
		pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
        modules = with self.homeModules; [
            # bar
            coding
            # defaultApps
            # discord
            # email
            extraPackages
            # firefox
            git
            # hyprland
            # kitty
            # neovim
            # niri
            # nix
            # prompt
            # recording
            # search
            # shells
            # snapshots
            # syncthing
            # theming
            matoo
        ];
    };

    flake.homeModules.matoo =
        { pkgs, ... }:
        {
            programs.home-manager.enable = true;

            home = {
                username = "matoo";
                homeDirectory = "/home/matoo";
                packages = with pkgs; [
                    kitty
                    git
                ];
                stateVersion = "25.11";
            };

			# mut home manager news
			news.display = "silent";
        };
}
