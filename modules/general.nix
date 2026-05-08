{ lib, inputs, ... }:
{
    imports = [
        inputs.flake-parts.flakeModules.modules
        inputs.home-manager.flakeModules.home-manager
        inputs.wrapper-modules.flakeModules.wrappers
        inputs.disko.flakeModules.default
    ];

    config = {
        systems = [
            "x86_64-linux"
        ];
    };
}
