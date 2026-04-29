{
    flake.nixosModules.networking = {
        networking = {
            networkmanager.enable = true;
            enableIPv6 = true;
            firewall.enable = true;
        };
    };
}
