{inputs, ...}: {
	flake.nixosModules.persistence = {
		# imports = [inputs.preservation.nixosModules.default];
		imports = [inputs.impermanence.nixosModules.impermanence];

		# see preservation docs
		systemd.suppressedSystemUnits = ["systemd-machine-id-commit.service"];

		# clean /tmp when booting (since its not in tmpfs)
		boot.tmp.cleanOnBoot = true;

		environment.persistence."/persistent" = {
			# preservation = {
			enable = true;
			hideMounts = true;

			# TODO: complete list through trial and error
			# TODO: split and move to relevant files
			# preserveAt."/persistent" = {
			files = [
				{
					file = "/etc/machine-id";
					# inInitrd = true;
				}
				# "/etc/shadow" # user passwords
				# "/etc/gshadow" # group passwords
			];
			directories = [
				"/etc/NetworkManager/system-connections" # paired networks
				"/var/lib/bluetooth" # paired devices
				"/var/lib/fprint" # enrolled finger prints
				"/var/lib/fwupd" # firmware
				"/var/lib/libvirt"
				"/var/lib/nixos" # nixos user state
				"/var/lib/power-profiles-daemon" # power settings
				"/var/lib/systemd/coredump" # logs?
				"/var/lib/systemd/rfkill" # ?
				"/var/lib/systemd/timers" # timers
				"/var/log" # logs
				# "/etc/secureboot" # secure boot keys ?
				# "/tmp" # temporary files, may otherwise fill tmpfs
			];

			users.matoo = {
				files = [
					".histfile"
				];
				directories = [
					# everything in these for now, sort it out later
					".local"
					".config"
					".mozilla"
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
	# };
}
