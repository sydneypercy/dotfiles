//@ pragma UseQApplication

import Quickshell
import QtQuick
import "./modules/bar"

shellroot {
	id: root
	Loader {
		active: true
		sourceComponent: bar{}
	}
}
