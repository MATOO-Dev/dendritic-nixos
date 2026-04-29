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
					inputs.disko.nixosModules.disko
					self.diskoConfigurations.matoo-vm
				];

			networking.hostname = "matoo-vm";
			system.stateVersion = "25.11";

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
