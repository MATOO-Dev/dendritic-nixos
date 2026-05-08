{
    inputs,
    self,
    ...
}:
{
    flake.homeModules.neovim =
        { pkgs, ... }:
        {
            programs.neovim = {
                enable = true;
                package = self.packages.${pkgs.stdenv.hostPlatform.system}.nvim-full;
                defaultEditor = true;
            };
        };

    perSystem =
        { pkgs, ... }:
        {
            packages.nvim-full =
                (inputs.nvf.lib.neovimConfiguration {
                    inherit pkgs;
                    modules = with self.modules.nvim; [
                        autocomplete
                        binds
                        debugging
                        diagnostics
                        git
                        languages
                        navigation
                        options
                        theme
                        typing
                        visuals
                    ];
                }).neovim;

            packages.nvim-small =
                (inputs.nvf.lib.neovimConfiguration {
                    inherit pkgs;
                    modules = with self.modules.nvim; [
                        binds
                        navigation
                        options
                    ];
                }).neovim;
        };
}
