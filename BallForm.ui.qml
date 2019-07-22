import QtQuick 2.4

Item {
    id: ball
    width: 20
    height: 20
    Rectangle {
        width: parent.width
        height: parent.height
        radius: 45
        border.width: 1
        border.color: "#000000"
    }
}
