{inputs, ...}: {
	imports = [
		inputs.flake-parts.flakeModules.modules
		inputs.home-manager.flakeModules.home-manager
		inputs.wrapper-modules.flakeModules.wrappers
		inputs.disko.flakeModules.default
		inputs.sops-nix.nixosModules.sops
	];

	systems = [
		"x86_64-linux"
	];

	flake.overlays.unstable = final: prev: {
		unstable =
			import inputs.nixpkgs-unstable {
				inherit (final.stdenv.hostPlatform) system;
				inherit (final) config;
			};
	};

	flake.nixosModules.nix = {
		nix = {
			settings.experimental-features = [
				"nix-command"
				"flakes"
			];
			optimise = {
				automatic = true;
				dates = ["04:00"];
			};
		};

		# see https://github.com/hercules-ci/flake-parts/issues/74
		nixpkgs.config.allowUnfree = true;
		nixpkgs.overlays = [inputs.self.overlays.unstable];

		# nix helper
		programs.nh = {
			enable = true;
			clean.enable = true;
			clean.extraArgs = "--keep 5 --keep-since 7d";
			flake = "/home/matoo/dendritic-nixos";
		};
	};

	flake.homeModules.nix = {
		imports = [inputs.nix-index-database.homeModules.default];
		# see https://github.com/hercules-ci/flake-parts/issues/74
		nixpkgs.config.allowUnfree = true;
		nixpkgs.overlays = [inputs.self.overlays.unstable];
	};
}
