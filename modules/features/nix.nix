{inputs, ...}: {
	imports = [
		inputs.flake-parts.flakeModules.modules
		inputs.home-manager.flakeModules.home-manager
		inputs.wrapper-modules.flakeModules.wrappers
		inputs.disko.flakeModules.default
	];

	systems = [
		"x86_64-linux"
	];

	perSystem = {system, ...}: {
		# _module.args.pkgs =
		# 	import inputs.nixpkgs.legacyPackages {
		# 		inherit system;
		# 		config.allowUnfree = true;
		# 	};
		# _module.args.pkgs-unstable =
		# 	import inputs.nixpkgs-unstable.legacyPackages {
		# 		inherit system;
		# 		config.allowUnfree = true;
		# 	};
	};

	flake.nixosModules.nix = {
		nix = {
			settings.experimental-features = [
				"nix-command"
				"flakes"
			];
		};

		nixpkgs.config = {
			allowUnfree = true;
			system = "x86_64-linux";
		};

		# nix helper
		programs.nh = {
			enable = true;
			clean.enable = true;
			clean.extraArgs = "--keep 5 --keep-since 7d";
			flake = "/home/matoo/dendritic-nixos";
		};

		# # automatic updates
		# system.autoUpgrade = {
		#     enable = false;
		#     allowReboot = false;
		#     flake = inputs.self.outPath;
		#     flags = [
		#         "--print-build-logs"
		#     ];
		#     dates = "06:00";
		#     randomizedDelaySec = "15min";
		#     channel = inputs.flake.nixpkgs;
		# };
	};

	flake.homeModules.nix = {
		imports = [
			inputs.nix-index-database.homeModules.default
		];
		nixpkgs.config = {
			allowUnfree = true;
		};
	};
}
