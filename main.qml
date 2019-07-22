import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 800
    height: 800
    minimumHeight: 800
    maximumHeight: 800
    minimumWidth: 800
    maximumWidth: 800
    title: qsTr("Bupong")

    MainBackground{
        id: mainBackground
        playerLeftScores: ballMain.playerLeftScore
        playerRightScores: ballMain.playerRightScore
        focus: true
        Timer {
            interval: 10;
            running: true;
            repeat: true;
            onTriggered: {
                playerLeft.move()
                playerRight.move()
                ballMain.move(1.00,0.00)
            }
        }

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

        Ball{
            id: ballMain
            playerRight: playerRight
            playerLeft: playerLeft
        }

        Component.onCompleted: {
            Keys.forwardTo = [playerLeft, playerRight]
        }
    }
}
