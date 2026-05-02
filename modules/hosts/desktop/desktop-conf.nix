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
                # firefox
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
                plasma
                printing
                snapshots
                # virtualization
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
        networking.hostname = "traveler";
        system.stateVersion = "25.11";

        # TODO: hardware config
        # hardware config
    };
}
