{
	flake.nixosModules.virtualization = {
		programs.virt-manager.enable = true;

		virtualization.libvirtd = {
			enable = true;
			qemu = {
				runAsRoot = true;
				swtpm.enable = true;
			};
		};
	};
}
