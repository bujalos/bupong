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

        property bool initialMove: true
        property var pressedKey

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

                parent.initialMove = ballMain.isMoveInitial
                parent.initialMove ? ballMain.initMove(1.00,0.00) : ballMain.move()
            }
        }

        Player{
            id: playerLeft
            x: 0
            y: 360
            up: Qt.Key_W
            down: Qt.Key_S
        }

        Player{
            id: playerRight
            x: 780
            y: 360
            up: Qt.Key_Up
            down: Qt.Key_Down
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
