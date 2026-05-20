{
	flake.nixosModules.snapshots = {
		# TODO: set up snapper for btrfs snapshots
		# this will take snapshots and send them to the backups disk
		services.snapper = {
		};
	};

	flake.homeModules.snapshots = {pkgs, ...}: {
		home.packages = with pkgs; [snapper-gui];
	};
}
