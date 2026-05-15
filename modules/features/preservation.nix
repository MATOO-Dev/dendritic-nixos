{
	flake.nixosModules.preservation = {
		# see ppreservation docs
		# systemd.suppressedSystemUnits = ["systemd-machine-id-commit.service"];
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
					"/tmp" # temporary files
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
