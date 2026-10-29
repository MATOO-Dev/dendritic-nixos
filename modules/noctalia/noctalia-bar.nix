{
	flake.modules.noctalia.bar = {
		settings.bar = {
			barType = "floating";
			position = "top";
			monitors = [];
			density = "comfortable";
			showOutline = false;
			showCapsule = true;
			capsuleOpacity = 1;
			capsuleColorKey = "none";
			widgetSpacing = 10;
			contentPadding = 5;
			fontScale = 1;
			enableExclusionZoneInset = false;
			backgroundOpacity = 0.93;
			useSeparateOpacity = false;
			marginVertical = 4;
			marginHorizontal = 4;
			frameThickness = 8;
			frameRadius = 12;
			outerCorners = true;
			hideOnOverview = true;
			displayMode = "always_visible";
			autoHideDelay = 500;
			autoShowDelay = 150;
			showOnWorkspaceSwitch = true;
			mouseWheelAction = "none";
			reverseScroll = false;
			mouseWheelWrap = true;
			middleClickAction = "none";
			middleClickFollowMouse = false;
			middleClickCommand = "";
			rightClickAction = "settings";
			rightClickFollowMouse = true;
			rightClickCommand = "";
			screenOverrides = [];
			widgets = {
				left = [
					{
						displayMode = "alwaysShow";
						iconColor = "none";
						id = "Volume";
						middleClickCommand = "pwvucontrol || pavucontrol";
						textColor = "none";
					}
					# {
					# 	displayMode = "alwaysShow";
					# 	iconColor = "none";
					# 	id = "Microphone";
					# 	middleClickCommand = "pwvucontrol || pavucontrol";
					# 	textColor = "none";
					# }
					{
						applyToAllMonitors = true;
						displayMode = "alwaysShow";
						iconColor = "none";
						id = "Brightness";
						textColor = "none";
					}
					{
						compactMode = false;
						hideMode = "hidden";
						hideWhenIdle = false;
						id = "MediaMini";
						maxWidth = 500;
						panelShowAlbumArt = true;
						scrollingMode = "hover";
						showAlbumArt = true;
						showArtistFirst = false;
						showProgressRing = true;
						showVisualizer = true;
						textColor = "none";
						useFixedWidth = false;
						visualizerType = "linear";
					}
				];
				center = [
					{
						characterCount = 2;
						colorizeIcons = false;
						emptyColor = "secondary";
						enableScrollWheel = true;
						focusedColor = "primary";
						followFocusedScreen = false;
						fontWeight = "bold";
						groupedBorderOpacity = 1;
						hideUnoccupied = true;
						iconScale = 0.8;
						id = "Workspace";
						labelMode = "index";
						occupiedColor = "secondary";
						pillSize = 0.6;
						showApplications = true;
						showApplicationsHover = false;
						showBadge = false;
						showLabelsOnlyWhenOccupied = true;
						unfocusedIconsOpacity = 1;
					}
					{
						clockColor = "none";
						customFont = "";
						formatHorizontal = "HH:mm ddd, MMM dd";
						formatVertical = "HH mm - dd MM";
						id = "Clock";
						tooltipFormat = "HH:mm ddd, MMM dd";
						useCustomFont = false;
					}
					{
						iconColor = "none";
						id = "KeepAwake";
						textColor = "none";
					}
				];
				right = [
					{
						blacklist = [];
						chevronColor = "none";
						colorizeIcons = false;
						drawerEnabled = false;
						hidePassive = true;
						id = "Tray";
						pinned = [];
					}
					{
						hideWhenZero = false;
						hideWhenZeroUnread = false;
						iconColor = "none";
						id = "NotificationHistory";
						showUnreadBadge = true;
						unreadBadgeColor = "primary";
					}
					{
						displayMode = "alwaysShow";
						iconColor = "none";
						id = "Bluetooth";
						textColor = "none";
					}
					{
						displayMode = "onhover";
						iconColor = "none";
						id = "Network";
						textColor = "none";
					}
					{
						deviceNativePath = "__default__";
						displayMode = "graphic";
						hideIfIdle = false;
						hideIfNotDetected = true;
						id = "Battery";
						showNoctaliaPerformance = false;
						showPowerProfiles = false;
					}
					{
						iconColor = "error";
						id = "SessionMenu";
					}
				];
			};
		};
	};
}
