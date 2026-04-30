{ inputs, self, ... }:
{
    flake.nixosConfigurations.matoo-vm = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            # audio
            # bluetooth
            # self.nixosModules.bootloader
            # compatibility
            # email
            # extraPackages
            # firefox
            # fonts
            # gaming
            # graphics
            # self.nixosModules.input
            # kernel
            # self.nixosModules.locale
            # localsend
            # login
            self.nixosModules.matoo
            # self.nixosModules.networking
            # niri
            # # nix
            # plasma
            # printing
            # snapshots
            # virtualization
            self.nixosModules.matoo-vm
            self.diskoConfigurations.matoo-vm
        ];

    };

    flake.nixosModules.matoo-vm = {
		# debug
		boot.loader.systemd-boot.enable = true;
		boot.loader.efi.canTouchEfiVariables = true;
		networking.networkmanager.enable = true;
		# end debug

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
