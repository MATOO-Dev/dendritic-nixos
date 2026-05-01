{
    description = "MATOO's dendritic NixOS config";

    inputs = {
        # packages
        nixpkgs.url = "github:nixos/nixpkgs/25.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

        # extra features
        home-manager.url = "github:nix-community/home-manager/release-25.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        # impermanence.url = "github:nix-community/impermanence"; # clean build every boot

        # config architecture
        flake-parts.url = "github:hercules-ci/flake-parts";
        import-tree.url = "github:vic/import-tree/latest";

        # hardware
        disko.url = "github:nix-community/disko";
        disko.inputs.nixpkgs.follows = "nixpkgs-unstable";
        # lanzaboote.url = "github:nix-community/lanzaboote"; # secure boot

        # # nvim
        # nvf.url = "github:notashelf/nvf";
        # nvf.inputs.nixpkgs.follows = "nixpkgs-unstable";

        # # theming
        stylix.url = "github:nix-community/stylix/release-25.11";
        stylix.inputs.nixpkgs.follows = "nixpkgs";

        # # search nixpkgs files
        nix-index-database.url = "github:nix-community/nix-index-database";
        nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

        # # run arbitrary binaries
        nix-alien.url = "github:thiagokokada/nix-alien";
        nix-alien.inputs.nixpkgs.follows = "nixpkgs";

        # # module wrappers
        # wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    };

    outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
