{ inputs, self, ... }:
{
    flake.nixosConfigurations.virtuoso = inputs.nixpkgs.lib.nixosSystem {
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
                # niri
                nix
                plasma
                printing
                snapshots
                # virtualization
                virtuoso
            ]
            ++ [
                self.diskoConfigurations.virtuoso
            ];

    };

    flake.nixosModules.virtuoso = {
        networking.hostName = "virtuoso";
        system.stateVersion = "25.11";

        # hardware config
        nixpkgs.hostPlatform = "x86_64-linux";
        boot = {
            initrd.availableKernelModules = [
                "ahci"
                "xhci_pci"
                "virtio_pci"
                "sr_mod"
                "virtio_blk"
            ];
            initrd.kernelModules = [ ];
            kernelModules = [ "kvm-amd" ];
            extraModulePackages = [ ];
        };

        # vm guest config
        services = {
            qemuGuest.enable = true;
            spice-vdagentd.enable = true;
            xserver.enable = true;
            xserver.videoDrivers = [ "virtio" ];
        };
    };
}
