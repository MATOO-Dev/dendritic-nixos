{
	flake.nixosConfigurations.matoo-laptop = {
		inputs,
		self,
		...
	}:
		inputs.nixpkgs.lib.nixosSystem {
			imports = with self.nixosModules; [
				audio
				bluetooth
				bootloader
				compatibility
				email
				extraPackages
				firefox
				fonts
				gaming
				graphics
				input
				kernel
				laptop-disk
				locale
				localsend
				login
				matoo
				networking
				niri
				nix
				plasma
				printing
				snapshots
				virtualization
				# fingerprint
				# powersave
				# kanata
			];

			networking.hostname = "matoo-laptop";
			system.stateVersion = "25.11";

			# hardware config
			boot.initrd.availableKernelModules = [
				"nvme"
				"xhci_pci"
				"thunderbolt"
				"usb_storage"
				"sd_mod"
			];
			boot.initrd.kernelModules = [];
			boot.kernelModules = ["kvm-amd"];
			boot.extraModulePackages = [];
			nixpkgs.hostPlatform = "x86_64-linux";
			hardware.enableRedistributableFirmware = true;
			hardware.cpu.amd.updateMicrocode = true;
		};
}
