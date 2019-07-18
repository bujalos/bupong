import QtQuick 2.12
import QtGraphicalEffects 1.12

Item {
    width: 400
    height: 400
    id: backgroundGradient
    anchors.fill: parent
    RadialGradient {
        horizontalOffset: 0
        verticalOffset: 0
        id: radialGradient
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0.021
                color: "#FFFFFF"
            }
            GradientStop {
                position: 0.025
                color: "#000000"
            }
            GradientStop {
                position: 0.033
                color: "#000000"
            }
            GradientStop {
                position: 0.04
                color: "#FFFFFF"
            }
            GradientStop {
                position: 0.4
                color: "#FFFFFF"
            }
            GradientStop {
                position: 0.41
                color: "#000000"
            }
        }
    }

    FontLoader {
        id: bupongFont
        source: "qrc:/fonts/VT323-Regular.ttf"
    }
    Text {
        id: element
        color: "#000000"
        text: qsTr("bup ng")
        anchors.rightMargin: 60
        anchors.bottomMargin: 62
        opacity: 0.2
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: bupongFont.name
        font.pixelSize: 150
    }
}
