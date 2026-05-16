{inputs, ...}:{
	flake.nixosModules.persistance = {
		imports = [ inputs.preservation.nixosModules.default ];

		# see preservation docs
		systemd.suppressedSystemUnits = ["systemd-machine-id-commit.service"];

		# clean /tmp when booting (since its not in tmpfs)
		boot.tmp.cleanOnBoot = true;

		preservation = {
			enable = true;

			# TODO: complete list through trial and error
			# TODO: split and move to relevant files
			preserveAt."/persistent" = {
				files = [
					{
						file = "/etc/machine-id";
						inInitrd = true;
					}
					# "/etc/shadow" # user passwords
					# "/etc/gshadow" # group passwords
				];
				directories = [
					"/var/lib/systemd/timers" # timers
					"/var/lib/nixos" # nixos user state
					"/var/log" # logs
					"/var/lib/bluetooth" # paired devices
					"/etc/NetworkManager/system-connections" # paired networks
					# "/tmp" # temporary files, may otherwise fill tmpfs
					"/var/lib/fprint" # enrolled finger prints
					"/var/lib/fwupd" # firmware
					"/var/lib/power-profiles-daemon" # power settings
					"/var/lib/systemd/coredump" # logs?
					"/var/lib/systemd/rfkill" # ?
				];

				users.matoo = {
					files = [
						".histfile"
					];
					directories = [
						".local"
						# everything in .local for now, sort out later
						# some starting points:
						# ".local/state/wireplumber" # im guessing audio?
						# ".local/state/syncthing" # syncthing config
						# ".local/state/lazygit" # lazygit config
						# ".local/share/Brotato" # save data
						# ".local/share/zoxide" # zoxide data
						# ".local/share/trash" # trashed files for restore
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
