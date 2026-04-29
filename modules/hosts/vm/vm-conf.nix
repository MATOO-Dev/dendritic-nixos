{
	flake.nixosConfigurations.matoo-vm = {
		inputs,
		self,
		...
	}:
		inputs.nixpkgs.lib.nixosSystem {
			imports = with self.nixosModules; [
				audio
				bluetooth
				bootloader
				email
				extraPackages
				firefox
				fonts
				gaming
				input
				kernel
				locale
				localsend
				login
				matoo
				networking
				niri
				nix
				printing
				snapshots
				vm-disk
			];

			networking.hostname = "matoo-vm";

			# hardware config
			boot.initrd.availableKernelModules = [
				"nvme"
				"xhci_pci"
				"virtio_pci"
				"sr_mod"
				"virtio_blk"
			];
			services = {
				qemuGuest.enable = true;
				spice-vdagentd.enable = true;
				xserver.enable = true;
				xserver.videoDrivers = ["virtio"];
			};
		};
}
