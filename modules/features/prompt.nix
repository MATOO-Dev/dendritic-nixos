{}
# {
# 	flake.homeModules.prompt = {lib, ...}: {
# 		programs.starship = {
# 			enable = true;
# 			enableBashIntegration = false;
# 			enableZshIntegration = true;
# 			enableFishIntegration = true;
# 			settings = {
# 				add_newline = true;
# 				scan_timeout = 10;
#
# 				palette = "rosepine";
#
# 				palettes.rosepine = {
# 					theme01 = "#1f1d2e";
# 					theme08 = "#eb6f92";
# 					theme09 = "#f6c177";
# 					theme0a = "#ebbcba";
# 					theme0b = "#31748f";
# 					theme0c = "#9ccfd8";
# 					theme0d = "#c4a7e7";
# 				};
#
# 				format =
# 					lib.strings.concatStrings [
# 						"$os"
# 						"[](bg:theme0a fg:theme09)"
# 						"$directory"
# 						"[](bg:theme0b fg:theme0a)"
# 						"$git_branch"
# 						"[](bg:theme0c fg:theme0b)"
# 						"$git_status"
# 						"[](fg:theme0c)"
# 						" "
# 					];
#
# 				right_format =
# 					lib.strings.concatStrings [
# 						"$character"
# 						"\${env_var.ZVM_MODE}"
# 						"[](fg:theme0d)"
# 						"$time"
# 						"[](fg:theme0d)"
# 					];
#
# 				os = {
# 					disabled = false;
# 					format = "[ $symbol ](bg:theme09 fg:theme01)";
# 					symbols.NixOS = " ";
# 				};
#
# 				directory = {
# 					disabled = false;
# 					format = "[ $path ](bg:theme0a fg:theme01)";
# 					truncation_length = 1;
# 					truncation_symbol = "../";
# 					substitutions = {
# 						"~" = " ";
# 						"Downloads" = " ";
# 						"Documents" = "󰈙 ";
# 						"Repos" = " ";
# 						"Dotfiles" = " ";
# 						"Rust" = " ";
# 					};
# 				};
#
# 				git_branch = {
# 					disabled = false;
# 					symbol = "";
# 					format = "[ $symbol $branch ](bg:theme0b fg:theme01)";
# 				};
#
# 				git_status = {
# 					disabled = false;
# 					ahead = " 󰁝$count ";
# 					behind = " 󰁅$count ";
# 					untracked = " ?$count ";
# 					modified = " !$count ";
# 					staged = " +$count ";
# 					renamed = " 󰄾$count ";
# 					deleted = " x$count ";
# 					format = "[$all_status$ahead$behind](bg:theme0c fg:theme01)";
# 				};
#
# 				time = {
# 					disabled = false;
# 					time_format = "%R";
# 					format = "[$time](bg:theme0d fg:theme01)";
# 				};
# 			};
# 		};
# 	};
# }

