{ inputs, ... }:
{
    flake.nixosModules.compatibility =
        { pkgs, ... }:
        {
            environment.systemPackages = with inputs.nix-alien.packages."x86_64-linux"; [
                nix-alien
            ];

            programs.nix-ld = {
                enable = true;
                libraries = [
                    pkgs.stream-run.fhsenv.args.multipkgs
                ];
            };
        };
}
