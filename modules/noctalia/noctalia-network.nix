{
	flake.modules.noctalia.network = {
		settings.network = {
			bluetoothRssiPollingEnabled = false;
			bluetoothRssiPollIntervalMs = 60000;
			networkPanelView = "ethernet";
			wifiDetailsViewMode = "grid";
			bluetoothDetailsViewMode = "grid";
			bluetoothHideUnnamedDevices = false;
			disableDiscoverability = false;
			bluetoothAutoConnect = true;
		};
	};
}
