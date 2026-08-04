{inputs, ...}: {
	flake.homeModules.calibre = {pkgs, ...}: {
		home.packages = with pkgs; [
			koreader
		];

		programs.calibre = {
			enable = true;
			# package =
			# 	pkgs.calibre.overrideAttrs (_attrs: {
			# 			postInstall = ''
			# 				wrapProgram $out/bin/calibre \
			# 				--set-default ACSM_LIBCRYPTO ${pkgs.openssl.out}/lib/libcrypto.so \
			# 				--set-default ACSM_LIBSSL ${pkgs.openssl.out}/lib/libssl.so
			# 			'';
			# 		});
		};

		# home.file = let
		# 	calibrePlugins = inputs.calibre-plugins.packages.${pkgs.stdenv.hostPlatform.system};
		# in {
		# 	".config/calibre/plugins/ACSM_Input.zip".source = calibrePlugins.acsm-calibre-plugin;
		# 	".config/calibre/plugins/DeDRM.zip".source = calibrePlugins.dedrm-plugin;
		# };
	};
}
