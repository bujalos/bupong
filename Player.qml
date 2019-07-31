import QtQuick 2.12
import "Helpers.js" as Helpers

PlayerForm {

    property var pressedKey
    property int speed: 3
    property var dirX: []
    property var dirY: []
    property string direction: "cons"

    function move () {
        dirY = Helpers.getElementDirection(dirY, y)

        switch (pressedKey) {

        case Qt.Key_W:
            if(playerLeft.y >= 0) {
                playerLeft.y-= speed
            }
            break

        case Qt.Key_S:
            if(playerLeft.y <= 720) {
                playerLeft.y+= speed
            }
            break

        case Qt.Key_Up:
            if(playerRight.y >= 0) {
                playerRight.y-= speed
            }
            break

        case Qt.Key_Down:
            if(playerRight.y <= 720) {
                playerRight.y+= speed
            }
            break

        default:
            //console.log("default case")
            break
        }
    }


    Keys.onPressed: {
        pressedKey = event.key
    }

    Keys.onReleased: {
        pressedKey = null
    }

}
