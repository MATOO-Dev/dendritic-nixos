{
	flake.modules.nvim.binds = {
		# disable all nvf supplied keymaps
		# vendoredKeymaps.enable = false;

		vim.globals = {
			mapleader = " ";
			maplocalleader = "\\";
		};

		vim.binds = {
			whichKey.enable = true;
		};

		vim.keymaps = let
			make_map = mode: key: action: desc: {
				inherit mode;
				inherit key;
				inherit action;
				inherit desc;
			};
			make_lua_map = mode: key: action: desc: {
				inherit mode;
				inherit key;
				inherit action;
				inherit desc;
				lua = true;
			};
		in [
			# keep the screen centered when jumping up/down
			(make_map "n" "<c-u>" "<c-u>zz" "Half page up")
			(make_map "n" "<c-d>" "<c-d>zz" "Half page down")
			(make_map "n" "<c-f>" "<c-f>zz" "Page down")
			(make_map "n" "<c-b>" "<c-b>zz" "Page down")

			#keep the screen centered when going to next/previous match
			(make_map "n" "n" "nzz" "Next Match")
			(make_map "n" "N" "Nzz" "Previous Match")

			#keep the screen centered when going back/forwards through cursor locations
			(make_map "n" "<c-i>" "<c-i>zz" "Next Cursor Location")
			(make_map "n" "<c-o>" "<c-o>zz" "Previous Cursor Location")

			# keep the screen centered when going to EOF
			(make_map "n" "G" "Gzz" "Goto EOF")

			# disable highlighting
			(make_map "n" "<leader>nh" "<cmd>noh<cr>" "Disable Search Highlighting")

			# alternative for switchting windows
			# (make_map "n" "<leader>w" "<c-w>" "Switch Window Init")

			# quit the current buffer
			(make_map "n" "<leader>q" "<cmd>bd<cr>" "Quit Buffer")

			# place empty line above/below without going into insert mode
			(make_map "n" "<cr>" "o<esc>" "Empty Line Below")
			(make_map "n" "<s-cr>" "O<esc>" "Empty Line Above")

			#go to next/previous buffer with count support
			# (make_map "n" "<c-s-k>" ''":<c-u>" .. v:count1 .. "bnext<cr>"'' "Next Buffer")
			# (make_map "n" "<c-s-j>" ''":<c-u>" .. v:count1 .. "bprev<cr>"'' "Previous Buffer")
			(make_map "n" "<c-s-k>" "<cmd>bnext<cr>" "Next Buffer")
			(make_map "n" "<c-s-j>" "<cmd>bprev<cr>" "Previous Buffer")

			# cycle through quickfix list without focus
			(make_map "n" "<a-n>" "<cmd>cnext<cr>" "Go to next quickfix item")

			# lsp actions
			(make_lua_map "n" "<f2>" "vim.lsp.buf.rename" "Rename symbol")
		];
	};
}
