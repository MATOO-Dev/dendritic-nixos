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

    # flake.wrappers.niri =
    #     { pkgs, wlib, ... }:
    #     {
    #         imports = [ wlib.wrapperModules.niri ];
    #         # configuration options here
    #     };

    perSystem = { pkgs, ... }:
        {
            packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
                inherit pkgs;

                imports = with self.modules.niri; [
					animations
					autostart
					binds
					environment
					input
					layout
					monitors
					windowrules
                ];
            };
        };
}
