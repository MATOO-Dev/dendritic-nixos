{
	flake.nixosModules.virtualization = {
		programs.virt-manager.enable = true;

		virtualisation.libvirtd.enable = true;

		# TODO: apply to all users
		users.users.matoo.extraGroups = [
			"libvirtd"
		];
	};
}
