{
	flake.nixosModules.extraPackages = {pkgs, ...}: {
		# these are only here so i have them on a fresh install
		# even before setting up my home-manager environment
		environment.systemPackages = with pkgs; [
			git # version control
			home-manager # manage home environment
			vim # text editor
		];
	};

	flake.homeModules.extraPackages = {pkgs, ...}: {
		home.packages = with pkgs; [
			# amberol # music player
			anki # flashcards
			audacity # audio editor
			unstable.ausweisapp # id verification
			bitwarden-desktop # password manager
			bitwarden-cli # password manager
			unstable.blender # 3d modeling
			# chromium # backup browser, main is firefox
			drawio # diagram maker
			# easytag # media metadata editor
			unstable.element-desktop # matrix client
			ente-auth # 2FA code generator
			unstable.ente-desktop # photo backups
			eog # gnome image viewer
			evince # gnome pdf viewer
			ffmpeg # media transcoder
			ffmpegthumbnailer # create file explorer thumbnails
			unstable.fluffychat # matrix client
			foliate # ebook reader # TODO: consider readest or koreader
			gimp # image editor
			gnome-disk-utility # disk management tool
			gnome-obfuscate # information censor
			gnucash # personal finace manager
			# gnuplot # graph plotting
			handbrake # ffmpeg frontend
			identity # media comparer
			kdePackages.ark # kde zip tool
			kdePackages.dolphin # file browser
			kdePackages.filelight # disk usage analyzer
			kdePackages.kolourpaint # paint scribbles
			kdePackages.kruler # measuring tool
			kdePackages.partitionmanager # disk management tool
			# libreoffice # office suite
			# masterpdfeditor # pdf editor
			mission-center # task manager
			# nautilus # file browser
			numbat # scientific calculation lang
			unstable.obsidian # note taking tool
			# onlyoffice-bin # office suite
			openfortivpn # vpn client
			pandoc # document converter
			pdfarranger # reorder and merge pdfs
			pdfpc # pdf presentation presenter
			pixieditor # image editor
			unstable.proton-authenticator # 2FA code generator
			unstable.proton-vpn # vpn client
			ripgrep # grep through files
			scrcpy # mirror android to pc
			# spotify # music app # also consider spicetify
			tldr # simplified man pages
			tree # print file tree
			# tutabridge # not packaged
			unstable.tutanota-desktop # mail / calendar client
			unstable.tuxedo # cli todo list manager
			unstable.typst # typst compiler
			unzip # unzipping from cli
			xournalpp # pdf annotation tool
			wget2 # cli file downloader
			# unstable.windscripte # vpn client, not packaged yet
		];
	};
}
