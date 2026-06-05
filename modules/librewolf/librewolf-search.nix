{
	flake.homeModules.librewolf = {
		programs.librewolf.profiles.matoo = {
			search = {
				default = "ecosia";
				privateDefault = "ecosia";
				force = true; # fix firefox search config file being in the way of rebuilds

				engines = {
					google.metaData.alias = "@g";
					bing.metaData.hidden = true;
					duckduckgo.metaData.hidden = true;
					ecosia = {
						name = "Ecosia search";
						icon = "https://ecosia.org/favicon.ico";
						urls = [{template = "https://ecosia.org/search?q={searchTerms}";}];
						definesAliases = ["@e"];
					};
					qwant = {
						name = "Qwant search";
						icon = "https://qwant.com/favicon.ico";
						urls = [{template = "https://qwant.com/?q={searchTerms}";}];
						definesAliases = ["@q"];
					};
					nix-packages = {
						name = "Nix package search";
						urls = [{template = "https://search.nixos.org/packages?query={searchTerms}";}];
						icon = "https://nixos.org/favicon.ico";
						definesAliases = ["@np"];
					};
					nix-options = {
						name = "Nix option search";
						urls = [{template = "https://search.nixos.org/options?query={searchTerms}";}];
						icon = "https://nixos.org/favicon.ico";
						definesAliases = ["@no"];
					};
					nixos-wiki = {
						name = "NixOS wiki";
						urls = [{template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";}];
						icon = "https://wiki.nixos.org/favicon.ico";
						definesAliases = ["@nw"];
					};
					mynixos = {
						name = "MyNixOS";
						urls = [{template = "https://mynixos.com/search?q={searchTerms}";}];
						icon = "https://mynixos.com/favicon.ico";
						definesAliases = ["@ns"];
					};
				};
			};
		};
	};
}
