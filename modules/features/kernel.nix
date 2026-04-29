{
	flake.nixosModules.kernel = {pkgs, ...}: {
		# use most recent available kernel
		boot.kernelPackages = pkgs.linuxPackages_latest;
	};
}
