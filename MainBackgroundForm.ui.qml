import QtQuick 2.12
import QtGraphicalEffects 1.12

Item {

    property int playerRightScores: 0
    property int playerLeftScores: 0

    width: 800
    height: 800
    id: backgroundGradient
    anchors.fill: parent
    Rectangle {
        color: "#808080"
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height
        width: 3
    }
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
        anchors.bottomMargin: 30
        opacity: 0.2
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: bupongFont.name
        font.pixelSize: 150
    }

    Text {
        id: textPlayerLeftScores
        x: 176
        color: "#b3b3b3"
        text: qsTr(`${playerLeftScores}`)
        horizontalAlignment: Text.AlignHCenter
        font.family: bupongFont.name
        font.pixelSize: 100
    }

    Text {
        id: textPlayerRightScores
        x: 576
        color: "#b3b3b3"
        text: qsTr(`${playerRightScores}`)
        horizontalAlignment: Text.AlignHCenter
        font.family: bupongFont.name
        font.pixelSize: 100
    }
}
