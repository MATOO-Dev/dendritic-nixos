{ inputs, self, ... }:
{
    flake.nixosConfigurations.matoo-vm = inputs.nixpkgs.lib.nixosSystem {
        modules =
            with self.nixosModules;
            [
                # audio
                # bluetooth
                bootloader
                # compatibility
                # email
                # extraPackages
                # firefox
                # fonts
                # gaming
                # graphics
                input
                # kernel
                locale
                # localsend
                # login
                matoo
                networking
                # niri
                # # nix
                # plasma
                # printing
                # snapshots
                # virtualization
                matoo-vm
            ]
            ++ [
                inputs.disko.nixosModules.disko
                self.diskoConfigurations.matoo-vm
            ];

    };

    flake.nixosModules.matoo-vm = {
        networking.hostName = "matoo-vm";
        system.stateVersion = "25.11";

        # hardware config
        boot.initrd.availableKernelModules = [
            "ahci"
            "xhci_pci"
            "virtio_pci"
            "sr_mod"
            "virtio_blk"
        ];
        boot.initrd.kernelModules = [ ];
        boot.kernelModules = [ "kvm-amd" ];
        boot.extraModulePackages = [ ];
        nixpkgs.hostPlatform = "x86_64-linux";

        # vm guest config
        services = {
            qemuGuest.enable = true;
            spice-vdagentd.enable = true;
            xserver.enable = true;
            xserver.videoDrivers = [ "virtio" ];
        };
    };
}
