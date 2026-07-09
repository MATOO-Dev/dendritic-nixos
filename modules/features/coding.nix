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
			gdb # c++ / rust compiler
			unstable.godot # game engine
			unstable.material-maker # PBR material tool
			renderdoc # graphics programming debugger
			rustc # rust compiler
			rustlings # rust beginner exercises
			scons # c++ meta build tool
			valgrind # c++ memory profiler
		];
	};
}
