{
    flake.nixosModules.audio =
        { pkgs, ... }:
        {
            environment.systemPackages = with pkgs; [
                pavucontrol
            ];

            services = {
                pulseaudio.enable = true;
                pipewire = {
                    enable = true;
                    alsa.enable = true;
                    alsa.support32Bit = true;
                    pulse.enable = true;
                };
            };

            # allows pipewire to use realtime scheduler for increased performance
            security.rtkit.enable = true;
        };
}
