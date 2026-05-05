{
	flake.modules.nvim.visuals = {
		vim.visuals.indent-blankline = {
			enable = true;
			setupOpts = {
				scope.enabled = true;
				scope.show_start = true;
				scope.show_end = false;
				indent.highlight = [
					"RainbowDelimiterRed"
					"RainbowDelimiterYellow"
					"RainbowDelimiterBlue"
					"RainbowDelimiterOrange"
					"RainbowDelimiterGreen"
					"RainbowDelimiterViolet"
					"RainbowDelimiterCyan"
				];
			};
		};

		vim.visuals.rainbow-delimiters = {
			enable = true;
			setupOpts.highlight = [
				"RainbowDelimiterRed"
				"RainbowDelimiterYellow"
				"RainbowDelimiterBlue"
				"RainbowDelimiterOrange"
				"RainbowDelimiterGreen"
				"RainbowDelimiterViolet"
				"RainbowDelimiterCyan"
			];
		};

		vim.statusline.lualine = {
			enable = true;
			theme = "auto";
			icons.enable = true;
			componentSeparator = {
				left = "|";
				right = "|";
			};
			sectionSeparator = {
				left = "";
				right = "";
			};
			activeSection = {
				a = ["{'mode'}"];
				b = ["{'diagnostics'}"];
				c = ["{'buffers'}"];
				x = ["{'filetype'}"];
				y = ["{'branch'}"];
				z = ["{'location'}"];
			};
		};

		vim.notify.nvim-notify = {
			enable = true;
			setupOpts = {
				# background_color = "#000000";
				render = "compact";
				stages = "fade";
			};
		};

		vim.ui.noice = {
			enable = true;
		};
	};
}
