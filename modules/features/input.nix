{
    flake.nixosModules.input = {
        services.xserver.xkb = {
            layout = "us";
            # layout = "eu"; # eurkey layout
            # variant = "";
            # gallium/canary does not exist
            # nixos wiki details setting up custom
            # or just use bazecor/kanata/ZMK
            # variant = "eu";
        };

        console.keyMap = "us";
        # console.keyMap = "eu"; # eurkey layout

        # TODO: find a way to automatically apply to all users
        # users.users.matoo.extraGroups = [
        #     "dialout" # bazecor
        # ];
    };

    # flake.homeModules.input =
    #     { pkgs, ... }:
    #     {
    #         home.packages = with pkgs; [
    #             bazecor
    #         ];
    #     };
}
