{
	inputs,
	self,
	...
}: {
	flake.nixosConfigurations.impermanent =
		inputs.nixpkgs.lib.nixosSystem {
			modules = with self.nixosModules;
				[
					bootloader
					extraPackages
					graphics
					input
					kernel
					locale
					login
					matoo
					networking
					niri
					nix
					# virtualization
					persistance
				]
				++ [
					self.nixosModules.impermanent
					self.diskoConfigurations.impermanent
				];
		};

	flake.nixosModules.impermanent = {
		networking.hostName = "impermanent";
		system.stateVersion = "25.11";

		# hardware config
		nixpkgs.hostPlatform = "x86_64-linux";
		boot = {
			initrd.systemd.enable = true;
			initrd.availableKernelModules = [
				"ahci"
				"xhci_pci"
				"virtio_pci"
				"sr_mod"
				"virtio_blk"
			];
			initrd.kernelModules = [];
			kernelModules = ["kvm-amd"];
			extraModulePackages = [];
		};

		# vm guest config
		services = {
			qemuGuest.enable = true;
			spice-vdagentd.enable = true;
			xserver.enable = true;
			xserver.videoDrivers = ["virtio"];
		};
	};
}
