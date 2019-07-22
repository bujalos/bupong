import QtQuick 2.13

BallForm {
    property double speed: 1.0
    property int playerRightScore: 0
    property int playerLeftScore: 0
    property var playerRight
    property var playerLeft

    x: 390.00
    y: 390.00

    function move (valX,valY) {
        if(playerLeftScore > playerRightScore) {
            x += (valX * speed)
            y += (valY * speed)
        }else if(playerRightScore > playerLeftScore) {
            x -= (valX * speed)
            y -= (valY * speed)
        }else{
            x += (valX * speed)
            y += (valY * speed)
        }

        //console.log(`Ball speed: ${speed} and position x: ${x}, y: ${y}`)
        //console.log(`Player right position X: ${playerRight.x} and Y: ${playerRight.y}`)

        checkScore()

    }

    // create scores and reset the ball
    function checkScore() {

        if (x > 780.00) {
            playerLeftScore++
            x = 390.00
            y = 390.00


        } else if (x < 10.00) {
            playerRightScore++
            x = 390.00
            y = 390.00

        }
    }
}
