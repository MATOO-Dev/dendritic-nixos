{ lib, inputs, ... }:
{
    imports = [
        inputs.flake-parts.flakeModules.modules
        inputs.home-manager.flakeModules.home-manager
        inputs.wrapper-modules.flakeModules.wrappers
    ];

    # options = {
    #     flake = inputs.flake-parts.lib.mkSubmoduleOptions {
    #         wrapperModules = inputs.nixpkgs.lib.mkOption {
    #             default = { };
    #         };
    #     };
    # };

    config = {
        systems = [
            "x86_64-linux"
        ];
    };
}
