{
	flake.homeModules.coding = {pkgs, ...}: {
		home.packages = with pkgs; [
			# glad # opengl function pointer loader (not packaged)
			assimp # asset importing library
			bacon # rust code checker
			cargo # rust package manager
			cargo-deny # cargo denpendency linting / license checking
			clang # clang compiler
			clang-tools # additional tools for clang
			dotnet-sdk_9 # c# sdk
			gdb # c++ / rust compiler
			godot # game engine
			renderdoc # graphics programming debugger
			rustc # rust compiler
			rustlings # rust beginner exercises
			scons # c++ meta build tool
			unityhub # game engine
			valgrind # c++ memory profiler
			omnisharp-roslyn
			netcoredbg
			vscode-fhs
			(vscode-with-extensions.override {
					vscode = vscodium;
					vscodeExtensions = with vscode-extensions; [
						catppuccin.catppuccin-vsc # theme
						# ms-dotnettools.csharp # C# integration
						# ms-dotnettools.vscode-dotnet-runtime # .net integration
						usernamehw.errorlens # inline errors
						visualstudiotoolsforunity.vstuc # unity integration
						vscodevim.vim # vim bindings
					];
				})
		];
	};
}
