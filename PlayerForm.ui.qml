import QtQuick 2.12

Item {
    property string playerName
    id: player
    width: 20
    height: 80
    antialiasing: true
    Rectangle {
        color: "#ffffff"
        border.color: "#000000"
        border.width: 2
        radius: 3
        anchors.fill: parent
    }
}
