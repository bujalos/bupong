import QtQuick 2.12
import "Helpers.js" as Helpers

PlayerForm {

    property var pressedKey
    property int speed: 3
    property var dirX: []
    property var dirY: []
    property string direction: "cons"

    function move () {

        switch (pressedKey) {

        case Qt.Key_W:
            if(playerLeft.y >= 0) {
                playerLeft.y-= speed                
                dirY = Helpers.getElementDirection(dirY, y)
                direction = Helpers.setElementDirection(dirY)
                console.log(`pressed ${playerLeft.playerName} and key W`)
            }
            break

        case Qt.Key_S:
            if(playerLeft.y <= 720) {
                playerLeft.y+= speed
                dirY = Helpers.getElementDirection(dirY, y)
                direction = Helpers.setElementDirection(dirY)
                console.log(`pressed ${playerLeft.playerName} and S`)
            }
            break

        case Qt.Key_Up:
            if(playerRight.y >= 0) {
                playerRight.y-= speed
                dirY = Helpers.getElementDirection(dirY, y)
                direction = Helpers.setElementDirection(dirY)
                console.log(`pressed ${playerRight.playerName} and key UP`)
            }
            break

        case Qt.Key_Down:
            if(playerRight.y <= 720) {
                playerRight.y+= speed
                dirY = Helpers.getElementDirection(dirY, y)
                direction = Helpers.setElementDirection(dirY)
                console.log(`pressed ${playerRight.playerName} and key DOWN`)
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
