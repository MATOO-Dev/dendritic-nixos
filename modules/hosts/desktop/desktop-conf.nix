{ inputs, self, ... }:
{
    # TODO: name
    flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
        modules =
            with self.nixosModules;
            [
                audio
                bluetooth
                bootloader
                compatibility
                email
                extraPackages
                fonts
                gaming
                graphics
                input
                kernel
                locale
                localsend
                login
                matoo
                messaging
                networking
                niri
                nix
                printing
                snapshots
				virtualization
				# debug
				flatpak
            ]
            ++ [
                # TODO: name
                self.nixosModules.desktop
                self.diskoConfigurations.desktop
            ];
    };

    # TODO: name
    flake.nixosModules.desktop = {
        # TODO: name
        networking.hostname = "desktop";
        system.stateVersion = "25.11";

		nixpkgs.hostPlatform = "x86_64-linux";

        # TODO: hardware config
        # hardware config
    };
}
