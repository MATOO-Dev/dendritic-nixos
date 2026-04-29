{
	flake.nixosModules.niri = {pkgs, ...}: {
		programs.niri.enable = true;

		services.gnome.gnome-keyring.enable = true;

		security.polkit.enable = true;

		environment.systemPackages = with pkgs; [
			mako # notifications
			sunsetr # blue light filter
			xwayland-satellite # xwayland compatibilit
		];
	};

	flake.homeModules.niri = {config, ...}: {
		home.file.".config/niri".source = config.lib.file.mkOutOfStoreSymlink ./../../dotfiles/niri;
		# home.file.".config/niri".source = ./../../dotfiles/niri;
	};
}
