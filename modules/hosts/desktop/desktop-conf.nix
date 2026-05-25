{
	inputs,
	self,
	...
}: {
	# TODO: name
	flake.nixosConfigurations.desktop =
		inputs.nixpkgs.lib.nixosSystem {
			modules = with self.nixosModules;
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
					portals
					printing
					snapshots
					ssh
					usb
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
		networking.hostName = "desktop";
		system.stateVersion = "25.11";

		# hardware config
		nixpkgs.hostPlatform = "x86_64-linux";
		boot = {
			initrd.availableKernelModules = [
				"nvme"
				"xhci_pci"
				"ahci"
				"usb_storage"
				"usbhid"
				"sd_mod"
			];
			initrd.kernelModules = [];
			kernelModules = ["kvm-amd"];
			extraModulePackages = [];
		};
		hardware.enableRedistributableFirmware = true;
		hardware.cpu.amd.updateMicrocode = true;
	};
}
