{
	flake.nixosConfigurations.matoo-vm = {
		inputs,
		self,
		...
	}:
		inputs.nixpkgs.lib.nixosSystem {
			imports = with self.nixosModules;
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
					nix
					# plasma
					# printing
					# snapshots
					# virtualization
				]
				++ [
					self.diskoConfigurations.matoo-vm
				];

			networking.hostname = "matoo-vm";
			system.stateVersion = "25.11";

			# hardware config
			boot.initrd.availableKernelModules = [
				"ahci"
				"xhci_pci"
				"virtio_pci"
				"sr_mod"
				"virtio_blk"
			];
			boot.initrd.kernelModules = [];
			boot.kernelModules = ["kvm-amd"];
			boot.extraModulePackages = [];
			nixpkgs.hostPlatform = "x86_64-linux";

			# vm guest config
			services = {
				qemuGuest.enable = true;
				spice-vdagentd.enable = true;
				xserver.enable = true;
				xserver.videoDrivers = ["virtio"];
			};
		};
}
