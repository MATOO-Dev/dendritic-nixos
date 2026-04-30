{
    flake.nixosModules.printing =
        { pkgs, ... }:
        {
            # enable CUPS to print documents
            services.printing = {
                enable = true;
                drivers = with pkgs; [
                    hplip # hp printer driver
                ];
            };

            # is this line required if i already defined it above?
            # ill leave it commented for now and test it next time i need to print
            # hp printer driver
            # environment.systemPackages = with pkgs; [ hplip ];

            # enable scanning
            hardware.sane = {
                enable = true;
                extraBackends = with pkgs; [
                    hplip # hp driver
                    # hplipWithPlugin # hp driver
                    # sane-airscan # apple airscan driver
                ];
            };

            # TODO: find a way to automatically apply to all users
            users.users.matoo.extraGroups = [
                "lp" # printing
                "scanner" # scanning
            ];
        };

    flake.homeModules.printing =
        { pkgs, ... }:
        {
            home.packages = with pkgs; [
                simple-scan # gnome scanning app
            ];
        };
}
