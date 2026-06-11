{
	inputs,
	self,
	...
}: {
	flake.nixosConfigurations.traveler =
		inputs.nixpkgs.lib.nixosSystem {
			modules = with self.nixosModules;
				[
					audio
					bluetooth
					bootloader
					compatibility
					email
					extraPackages
					# fingerprint
					fonts
					gaming
					graphics
					input
					# kanata
					kernel
					locale
					localsend
					login
					matoo
					networking
					niri
					nix
					portals
					powersave
					printing
					snapshots
					ssh
					usb
					virtualization
					# debug
					flatpak
				]
				++ [
					self.nixosModules.traveler
					self.diskoConfigurations.traveler
				];
		};

	flake.nixosModules.traveler = {
		networking.hostName = "traveler";
		system.stateVersion = "25.11";

		# hardware config
		nixpkgs.hostPlatform = "x86_64-linux";
		boot = {
			initrd.availableKernelModules = [
				"nvme"
				"xhci_pci"
				"thunderbolt"
				"usb_storage"
				"sd_mod"
			];
			initrd.kernelModules = [];
			kernelModules = ["kvm-amd"];
			extraModulePackages = [];
			# debug
			kernelParams = ["amdgpu.dcdebugmask=0x10"];
		};
		hardware.enableRedistributableFirmware = true;
		hardware.cpu.amd.updateMicrocode = true;
	};
}
