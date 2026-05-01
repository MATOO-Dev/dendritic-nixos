{ inputs, self, ... }:
{
    flake.nixosModules.niri =
        { pkgs, ... }:
        {
            programs.niri = {
                enable = true;
                package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
            };
            services.gnome.gnome-keyring.enable = true;
            security.polkit.enable = true;
            environment.systemPackages = with pkgs; [
                mako # notifications
                sunsetr # blue light filter
            ];
        };

    perSystem =
        {
            pkgs,
            lib,
            ...
        }:
        {
            packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
                inherit pkgs;

                imports = [ ];

                settings = {
                    xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
                };
            };
        };
}
