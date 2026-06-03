{
	flake.nixosModules.kernel = {pkgs, ...}: {
		# use most recent available kernel
		boot.kernelPackages = pkgs.unstable.linuxPackages_latest;
	};
}
