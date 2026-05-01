{ inputs, ... }:
{
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
