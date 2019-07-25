import QtQuick 2.12
import "Helpers.js" as Helpers

BallForm {
    property double speed: 1.0
    property int playerRightScore: 0
    property int playerLeftScore: 0
    property var playerR: { x: new Array; y: new Array; }
    property var playerL: { x: new Array; y: new Array; }
    property var playerRight
    property var playerLeft    
    property bool isMoveInitial: true
    property var dirX: []
    property var dirY: []
    property string direction
    property string playerRightDirection
    property string playerLeftDirection

    x: 390.00
    y: 390.00

    // sets initial move on the beginnig and after each score
    function initMove(valX,valY) {
        // initial ball movement
        if(playerLeftScore > playerRightScore) {
            x += (valX * speed)
            y += (valY * speed)
            dirX = Helpers.getElementDirection(dirX, x)
            dirY = Helpers.getElementDirection(dirY, y)
        }else if(playerRightScore > playerLeftScore) {
            x -= (valX * speed)
            y -= (valY * speed)
            dirX = Helpers.getElementDirection(dirX, x)
            dirY = Helpers.getElementDirection(dirY, y)
        }else{
            x += (valX * speed)
            y += (valY * speed)
            dirX = Helpers.getElementDirection(dirX, x)
            dirY = Helpers.getElementDirection(dirY, y)
        }
        checkPosition()
        console.log(`Player right position X: ${playerRight.x} and Y: ${playerRight.y}`)
    }

    function move() {
      console.log("move normal...")
    }


    //console.log(`Ball speed: ${speed} and position x: ${x}, y: ${y}`)

    // create scores and and sets initial move to true
    function checkPosition() {
        if(x > 771.00) {
            ballMain.playerLeftScore++
            ballMain.x = 390.00
            ballMain.y = 390.00
            ballMain.isMoveInitial = true
        }else if(x < 19.00) {
            ballMain.playerRightScore++
            ballMain.x = 390.00
            ballMain.y = 390.00
            ballMain.isMoveInitial = true
        }else{
            ballMain.isMoveInitial = !Helpers.checkCollision(ballMain,playerR,playerLeft)
        }
    }

}
