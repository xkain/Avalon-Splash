import QtQuick 2.5

Image {
    id: root
    source: "images/background.png"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0
       
        Image {
            id: logo
            //match SDDM/lockscreen avatar positioning
            readonly property real size: PlasmaCore.Units.gridUnit * 8

            anchors.centerIn: parent

            asynchronous: true
            source: "images/plasma.svg"
            sourceSize.width: 360
            sourceSize.height: 360
        }

        Image {
            id: busyIndicator
            source: "images/loader.svg"
            anchors.centerIn: parent
            sourceSize.height: 320
            sourceSize.width: 320
            RotationAnimator on rotation {
                id: rotationAnimator
                from: 0
                to: 360
                duration: 2000
                loops: Animation.Infinite
            }
        }
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
