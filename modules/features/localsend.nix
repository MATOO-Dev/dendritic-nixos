{
    flake.nixosModules.localsend = {
        programs.localsend = {
            enable = true;
            # opens port 53317 for TCP/UDP
            openFirewall = true;
        };
    };
}
