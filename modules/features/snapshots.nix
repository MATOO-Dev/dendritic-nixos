{
    flake.nixosModules.snapshots = {
        # TODO: set up snapper for btrfs snapshots
        services.snapper = {
        };
    };

    flake.homeModules.snapshots =
        { pkgs, ... }:
        {
            home.packages = with pkgs; [ snapper-gui ];
        };
}
