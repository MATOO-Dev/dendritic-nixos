{
	self,
	inputs,
	...
}: {
	flake.homeModules.fastfetch = {pkgs, ...}: {
		home.packages = [
			self.packages.${pkgs.stdenv.hostPlatform.system}.fastfetch
		];
	};

	perSystem = {
		pkgs,
		lib,
		...
	}: {
		packages.fastfetch =
			inputs.wrapper-modules.wrappers.fastfetch.wrap {
				inherit pkgs;
				# adapted from https://www.reddit.com/r/NixOS/comments/1tt2qww/fastfetchconfig/
				settings = {
					logo = {
						type = "kitty-direct";
						source =
							pkgs.fetchurl {
								url = "https://camo.githubusercontent.com/4d0f616767bd4f25aa0da8f52498ffc690562c8166ea48811387c24a519802c0/68747470733a2f2f692e696d6775722e636f6d2f367146436c41312e706e67";
								hash = "sha256-XgWT+5hZiRRLpc44fYLNPucdT/oA9abgyboDWoSuKB8=";
							};
						height = 20;
						width = 40;
						padding.top = 2;
						padding.left = 3;
					};
					display = {
						separator = " ";
						constants =
							lib.map builtins.fromJSON [
								''"\u001b[38;2;81;188;254m\u001B[1m"'' # {$1}
								''"\u001b[38;2;105;181;254m\u001B[1m"'' # {$2}
								''"\u001b[38;2;130;173;253m\u001B[1m"'' # {$3}
								''"\u001b[38;2;154;166;253m\u001B[1m"'' # {$4}
								''"\u001b[38;2;169;160;253m\u001B[1m"'' # {$5}
								''"\u001b[38;2;179;154;253m\u001B[1m"'' # {$6}
								''"\u001b[38;2;186;153;253m\u001B[1m"'' # {$7}
								''"\u001b[38;2;192;163;253m\u001B[1m"'' # {$8}
								''"\u001b[38;2;198;167;253m\u001B[1m"'' # {$9}
								''"\u001b[38;2;205;173;252m\u001B[1m"'' # {$10}
								''"┌──────"'' # {$11}
								''"───────"'' # {$12}
								''"──────┐"'' # {$13}
							];
						percent = {
							type = 9; # 1 = number, 2 = bar, 3 = both, 9 = colored number
							color = {
								green = "#51bcfe";
								yellow = "#abff4a";
								red = "#ff8f45";
							};
						};
					};
					modules = [
						"break"
						{
							type = "custom";
							format = "{$1}{$11}{$2}{$12}{$3}{$12}{$4}{$12}{$5}{$12}{$6}{$12}{$7}{$12}{$8}{$12}{$9}{$12}{$10}{$13} Hardware ";
						}
						{
							type = "host";
							key = "{$1}├   PC        ";
						}
						{
							type = "board";
							key = "{$2}├ 󱔼  Board     ";
						}
						{
							type = "cpu";
							key = "{$3}├   CPU       ";
						}
						{
							type = "gpu";
							key = "{$4}├ 󰾲  GPU       ";
						}
						{
							type = "display";
							key = "{$5}├ 󰍹  Display   ";
						}
						{
							type = "sound";
							#format= "{platform-api}/{2} ({3})";
							key = "{$6}├   Sound     ";
						}
						{
							type = "battery";
							key = "{$6}├ 󰢟  Battery   ";
							percent = {
								"type" = 3; # 3 = number + bar + percentage
								"green" = 30; # <30% = green
								"yellow" = 70; # 30-70% = yellow; >70% = red
							};
						}
						{
							type = "memory";
							key = "{$7}├   Memory    ";
							percent = {
								"type" = 3; # 3 = number + bar + percentage
								"green" = 30; # <30% = green
								"yellow" = 70; # 30-70% = yellow; >70% = red
							};
						}
						{
							type = "swap";
							key = "{$8}├ 󰯍  Swap      ";
							percent = {
								"type" = 3; # 3 = number + bar + percentage
								"green" = 30; # <30% = green
								"yellow" = 70; # 30-70% = yellow; >70% = red
							};
						}
						{
							type = "disk";
							key = "{$9}├   NixOS     ";
							folders = ["/"];
							percent = {
								"type" = 3; # 3 = number + bar + percentage
								"green" = 30; # <30% = green
								"yellow" = 70; # 30-70% = yellow; >70% = red
							};
						}
						{
							type = "disk";
							key = "{$10}└   Home      ";
							folders = ["/home"];
							percent = {
								"type" = 3; # 3 = number + bar + percentage
								"green" = 30; # <30% = green
								"yellow" = 70; # 30-70% = yellow; >70% = red
							};
						}
						{
							type = "custom";
							format = "{$10}{$11}{$9}{$12}{$8}{$12}{$7}{$12}{$6}{$12}{$5}{$12}{$4}{$12}{$3}{$12}{$2}{$12}{$1}{$13} Software ";
						}
						{
							type = "os";
							key = "{$10}├   Distro    ";
							format = "{name} {build-id} ({codename}) {arch}";
						}
						{
							type = "kernel";
							key = "{$10}├   Kernel    ";
						}
						{
							type = "packages";
							key = "{$9}├ 󰏖  Packages  ";
						}
						{
							type = "shell";
							key = "{$8}├   Shell     ";
						}
						{
							type = "terminal";
							key = "{$7}├   Terminal  ";
						}
						{
							type = "terminalfont";
							key = "{$6}├ 󰛖  Term Font ";
						}
						{
							type = "de";
							key = "{$5}├   DE        ";
						}
						{
							type = "lm";
							key = "{$4}├ 󰧨  Login     ";
						}
						{
							type = "wm";
							key = "{$3}├   WindowMgr ";
						}
						{
							type = "wmtheme";
							key = "{$2}├ 󰉼  Theme     ";
						}
						{
							type = "font";
							key = "{$2}├ 󰛖  Font      ";
						}
						{
							type = "custom";
							format = "{$1}{$11}{$2}{$12}{$3}{$12}{$4}{$12}{$5}{$12}{$6}{$12}{$7}{$12}{$8}{$12}{$9}{$12}{$10}{$13} Connectivity";
						}
						{
							type = "wifi";
							key = "{$2}├   WiFi      ";
							format = "{4} - {7} - {13} GHz - {10}";
							showErrors = "never";
						}
						{
							type = "bluetooth";
							key = "{$1}├ 󰂱  Bluetooth ";
							format = "{1} - {4}";
						}
						{
							type = "localip";
							key = "{$6}├ 󰩟  Local IP  ";
							format = "{1} - {3}";
							showMac = true;
						}
						{
							type = "custom";
							format = "{$10}{$11}{$9}{$12}{$8}{$12}{$7}{$12}{$6}{$12}{$5}{$12}{$4}{$12}{$3}{$12}{$2}{$12}{$1}{$13} Time ";
						}
						{
							type = "DateTime";
							key = "{$10}├ 󰥔  Date/Time ";
						}
						{
							key = "{$8}├   OS Age    ";
							type = "disk";
							folders = "/";
							format = "{create-time:10} ({days} days)";
						}
						{
							type = "uptime";
							key = "{$6}└   Uptime    ";
						}
					];
				};
			};
	};
}
