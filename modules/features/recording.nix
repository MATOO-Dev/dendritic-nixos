{
	flake.nixosModules.recording = {
		pkgs,
		lib,
		...
	}: {
		programs.gpu-screen-recorder = {
			enable = true;
			# old config
			# move to ~/.config/gpu-screen-recorder/gpu-screen-recorder.env
			# WINDOW=DP-2|1920x1080
			# CONTAINER=mp4
			# CODEC=h264 # look into HEVC
			# AUDIO_CODEC=opus
			# AUDIO_DEVICE=alsa_output.usb-Schiit_Audio_I_m_Fulla_Schiit-00.analog-stereo.monitor
			# SECONDARY_AUDIO_DEVICE=alsa_input.usb-Kingston_HyperX_QuadCast_S_4100-00.analog-stereo
			# FRAMERATE=60
			# REPLAYDURATION=60
			# OUTPUTDIR=/home/matoo/Videos/Replays
			# KEYINT=2
			# ENCODER=gpu
			# RESTORE_PORTAL_SESSION=yes
		};

		# systemd.packages = [pkgs.gpu-screen-recorder];
		systemd.user.services.gsr-replay = {
			enable = true;
			wantedBy = ["graphical-session.target"];
			description = "GPU screen recorder";
			serviceConfig = {
				Type = "simple";
				StandardOutput = "null";
				ExecStart = ''
					${lib.getExe pkgs.gpu-screen-recorder} \
					# monitor
					-w DP-2 \
					# resolution
					-s 1920x1080 \
					# framerate
					-f 60 \
					# replay duration
					-r 30 \
					# format
					-c mp4 \
					# audio
					-a 'default_output'|'default_input' \
					# output location
					-o /home/matoo/Videos/Replays
				'';
				Restart = "on-failure";
				RestartSec = 30;
			};
		};
	};
}
