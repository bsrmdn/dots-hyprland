pragma ComponentBehavior: Bound
import qs.services
import qs.modules.common
import qs.modules.common.widgets
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Bluetooth
import qs.modules.overlay.crosshair
import qs.modules.overlay.volumeMixer
import qs.modules.overlay.fpsLimiter
import qs.modules.overlay.recorder
import qs.modules.overlay.resources
import qs.modules.overlay.stickypad

DelegateChooser {
    id: root
    role: "identifier"

    DelegateChoice { roleValue: "crosshair"; Crosshair {} }
    DelegateChoice { roleValue: "floatingImage"; FloatingImage {} }
    DelegateChoice { roleValue: "fpsLimiter"; FpsLimiter {} }
    DelegateChoice { roleValue: "recorder"; Recorder {} }
    DelegateChoice { roleValue: "resources"; Resources {} }
    DelegateChoice { roleValue: "notes"; Stickypad {} }
    DelegateChoice { roleValue: "volumeMixer"; VolumeMixer {} }
    // CUSTOM: Stickypad integration - START
    DelegateChoice { roleValue: "stickypad"; Stickypad {} }
}
