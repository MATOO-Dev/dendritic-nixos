{inputs, ...}:{
	flake.nixosModules.preservation = {
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
				];
				directories = [
					"/var/lib/systemd/timers" # timers
					"/var/lib/nixos" # nixos user state
					"/var/log" # logs
					"/var/lib/bluetooth" # paired devices
					"/etc/NetworkManager/system-connections" # paired networks
					"/tmp" # temporary files, may otherwise fill tmpfs
				];

				users.matoo = {
					files = [];
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
