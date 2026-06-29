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
			unstable.blender # 3d modeling
			# chromium # backup browser, main is librewolf
			drawio # diagram maker
			# easytag # media metadata editor
			element-desktop # matrix client
			eog # gnome image viewer
			evince # gnome pdf viewer
			ffmpeg # media transcoder
			ffmpegthumbnailer # create file explorer thumbnails
			foliate # ebook reader
			footage # video trimmer
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
			kdePackages.kdenlive # video editor
			kdePackages.kolourpaint # paint scribbles
			kdePackages.kruler # measuring tool
			kdePackages.partitionmanager # disk management tool
			# libreoffice # office suite
			masterpdfeditor # pdf editor
			mission-center # task manager
			mpv # video player
			# nautilus # file browser
			numbat # scientific calculation lang
			unstable.obsidian # note taking tool
			# onlyoffice-bin # office suite
			openfortivpn # vpn client
			pandoc # document converter
			pdfarranger # reorder and merge pdfs
			pdfpc # pdf presentation presenter
			unstable.pixieditor # image editor
			unstable.proton-authenticator # 2FA code generator
			unstable.proton-vpn # vpn client
			ripgrep # grep through files
			scrcpy # mirror android to pc
			# spotify # music app # also consider spicetify
			tldr # simplified man pages
			tree # print file tree
			unstable.tuxedo # cli todo list manager
			unstable.typst # typst compiler
			unzip # unzipping from cli
			vlc # video player
			xournalpp # pdf annotation tool
			yt-dlg # download videos graphically
			yt-dlp # download videos from cli
			wget2 # cli file downloader
		];
	};
}
