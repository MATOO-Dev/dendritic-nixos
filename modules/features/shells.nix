let
	shell-aliases = {
		nv = "nvim";
		# nv = "nix run github:matoo-dev/nixcats-config";
		# nvim = "nix run github:matoo-dev/nixcats-config";
		laz = "lazygit";
		open = "xdg-open";
		# ls = "ls --color";
		ls = "eza --icons";
		clear = "printf '\\033[2J\\033[3J\\033[1;1H'"; # clears scrollback buffer as well
		rm = "rmtrash";
		rmdir = "rmdirtrash";
		gitreset = "git reset --hard origin/main";
		buildHome = "home-manager switch --flake ~/den-config/flake.nix#matoo";
	};
in {
	flake.homeModules.shells = {pkgs, ...}: {
		programs.bash = {
			enable = true;
			enableCompletion = true;
			shellAliases = shell-aliases;
			historyFileSize = 10000;
			historyControl = [
				"ignoredups"
				"ignorespace"
			];
		};

		programs.zsh = {
			enable = true;
			shellAliases = shell-aliases;
			enableCompletion = true;
			syntaxHighlighting.enable = true;
			historySubstringSearch.enable = true;
			history = {
				size = 10000;
				# share live between sessions
				share = true;
				# ignore duplicates
				# ignoreDups = true;
				# delete old, replace with duplicate
				ignoreAllDups = true;
				# dont write duplicates to history
				# saveNoDups = true;
				# just in case
				expireDuplicatesFirst = true;
				# dont save to history if first character is a space
				ignoreSpace = true;
			};
			plugins = [
				{
					name = "zsh-autosuggestions";
					src = pkgs.zsh-autosuggestions;
					file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
				}
			];
			initContent = ''
				# case-insensitive autocompletion
				zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
				# enable ls colors for autocompletion
				 				zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
			'';
			# env vars
			# editor = nv
			# visual = nv
			# xdg_cache_dir = ~/.cache
			# path = path:~/.cargo/bin
		};

		programs.fish = {
			enable = true;
			# offer autocompletion from man pages
			generateCompletions = true;
			shellAbbrs = shell-aliases;
			interactiveShellInit = ''
				set fish_greeting # disable greeting
			'';
		};

		programs.zoxide = {
			enable = true;
			enableBashIntegration = true;
			enableZshIntegration = true;
			enableFishIntegration = true;
			options = ["--cmd j"];
		};

		home.packages = with pkgs; [
			eza
			rmtrash
		];
	};
}
