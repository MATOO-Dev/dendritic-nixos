{
	flake.nixosModules.snapshots = {
		# TODO
		services.snapper = {
		};
	};

	flake.homeModules.snapshots = {pkgs, ...}: {
		home.packages = with pkgs; [snapper-gui];
	};
}
