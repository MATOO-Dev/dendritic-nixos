{inputs, ...}:{
	flake.nixosModules.persistance = {
		imports = [ inputs.preservation.nixosModules.default ];

		# see preservation docs
		systemd.suppressedSystemUnits = ["systemd-machine-id-commit.service"];

		# clean /tmp when booting (since its not in tmpfs)
		boot.tmp.cleanOnBoot = true;

		preservation = {
			enable = true;
			preserveAt."/persistent" = {
				files = [
					{
						file = "/etc/machine-id";
						inInitrd = true;
					}
					"/etc/shadow" # user passwords
					"/etc/gshadow" # group passwords
				];
				directories = [
					"/var/lib/systemd/timers" # timers
					"/var/lib/nixos" # nixos user state
					"/var/log" # logs
					"/var/lib/bluetooth" # paired devices
					"/etc/NetworkManager/system-connections" # paired networks
					# "/tmp" # temporary files, may otherwise fill tmpfs
					"/var/lib/fprint"
					"/var/lib/fwupd"
					"/var/lib/power-profiles-daemon"
					"/var/lib/systemd/coredump"
					"/var/lib/systemd/rfkill"
				];

				users.matoo = {
					files = [
						".histfile"
					];
					directories = [
						".local/state/wireplumber"
						"Books" # epubs/pdfs
						"Documents" # documents
						"Downloads" # downloads
						"Music" # music
						"Pictures" # screenshots etc
						"Repos" # projects
						"Templates" # file templates
						"Unity" # game engine, temporary
						"Videos" # recordings etc
						"dendritic-nixos" # this config
						"Vaults" # obsidian
					];
				};
			};
		};
	};
}
