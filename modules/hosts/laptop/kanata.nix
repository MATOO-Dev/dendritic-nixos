{
	flake.nixosModules.kanata = {
		hardware.uinput.enable = true;
		users.users.matoo.extraGroups = [
			"input"
			"uinput"
		];
		services.kanata = {
			# extra groups are only applied on reboot
			# kanata breaks rebuilds when not already part of those groups
			# if needed, set enable=false, rebuild & reboot, then try again
			enable = true;
			keyboards.builtin = {
				extraDefCfg = "process-unmapped-keys yes";
				config = ''
					(defsrc
					  caps tab a s d f j k l ;
					)
					(defvar
					  tap-time 150
					  hold-time 200
					)

					(defalias
					  caps (tap-hold $tap-time $hold-time tab tab)
					  tab (tap-hold $tap-time $hold-time esc esc)
					  a (tap-hold $tap-time $hold-time a ralt)
					  s (tap-hold $tap-time $hold-time s lalt)
					  d (tap-hold $tap-time $hold-time d lctl)
					  f (tap-hold $tap-time $hold-time f lsft)
					  j (tap-hold $tap-time $hold-time j lsft)
					  k (tap-hold $tap-time $hold-time k lctl)
					  l (tap-hold $tap-time $hold-time l lalt)
					  ; (tap-hold $tap-time $hold-time ; ralt)
					)

					(deflayer base
					  @caps @tab @a @s @d @f @j @k @l @;
					)
				'';
			};
		};
	};
}
