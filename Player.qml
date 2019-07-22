import QtQuick 2.13

PlayerForm {

    property var pressedKey
    property int speed: 3

    function move () {

        switch (pressedKey) {

        case Qt.Key_W:
            if(playerLeft.y >= 0) {
                playerLeft.y-= speed
                console.log(`pressed ${playerLeft.playerName} and key W`)
            }
            break

        case Qt.Key_S:
            if(playerLeft.y <= 720) {
                playerLeft.y+= speed
                console.log(`pressed ${playerLeft.playerName} and S`)
            }
            break

        case Qt.Key_Up:
            if(playerRight.y >= 0) {
                playerRight.y-= speed
                console.log(`pressed ${playerRight.playerName} and key UP`)
            }
            break

        case Qt.Key_Down:
            if(playerRight.y <= 720) {
                playerRight.y+= speed
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
