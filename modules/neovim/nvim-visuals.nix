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
			setupOpts = {
				theme = "auto";
				icons_enabled = true;
				component_separators = {
					left = "|";
					right = "|";
				};
				section_separators = {
					left = "";
					right = "";
				};
				sections = {
					lualine_a = [{"@1" = "mode";}];
					lualine_b = [{"@1" = "diagnostics";}];
					lualine_c = [{"@1" = "buffers";}];
					lualine_x = [{"@1" = "filetype";}];
					lualine_y = [{"@1" = "branch";}];
					lualine_z = [{"@1" = "location";}];
				};
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
