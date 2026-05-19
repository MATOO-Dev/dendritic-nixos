{
	flake.nixosModules.virtualization = {pkgs, ...}: {
		programs.virt-manager.enable = true;

		virtualisation.libvirtd.enable = true;

		environment.systemPackages = with pkgs; [
			dnsmasq
		];

		# TODO: apply to all users
		users.users.matoo.extraGroups = [
			"libvirtd"
		];
	};
}
