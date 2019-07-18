import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 800
    height: 800
    title: qsTr("Hello World")
    MainBackground{
        id: mainBackground
        focus: true
        Player{
            playerName: "playerLeft"
            id: playerLeft
            x: 0
            y: 360
        }
        Player{
            playerName: "playerRight"
            id: playerRight
            x: 780
            y: 360
        }

        Keys.onPressed: {
            if (event.key === Qt.Key_Up && playerRight.y >= 0) {
                playerRight.y-=5
                console.log(`pressed ${playerRight.playerName} and key UP`)
            }
            if (event.key === Qt.Key_Down && playerRight.y <= 720) {
                playerRight.y+=5
                console.log(`pressed ${playerRight.playerName} and key DOWN`)
            }

            if (event.key === Qt.Key_W && playerLeft.y >= 0) {
                playerLeft.y-=5
                console.log(`pressed ${playerLeft.playerName} and key W`)
            }
            if (event.key === Qt.Key_S && playerLeft.y <= 720) {
                playerLeft.y+=5
                console.log(`pressed ${playerLeft.playerName} and S`)
            }
        }

    }
}
