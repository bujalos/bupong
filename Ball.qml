import QtQuick 2.12

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

    x: 390.00
    y: 390.00

    // sets initial move on the beginnig and after each score
    function initMove(valX,valY) {
        // initial ball movement
        if(playerLeftScore > playerRightScore) {
            x += (valX * speed)
            y += (valY * speed)
            dirX = elementDirection(dirX, x)
            dirY = elementDirection(dirY, y)
        }else if(playerRightScore > playerLeftScore) {
            x -= (valX * speed)
            y -= (valY * speed)
            dirX = elementDirection(dirX, x)
            dirY = elementDirection(dirY, y)
        }else{
            x += (valX * speed)
            y += (valY * speed)
            dirX = elementDirection(dirX, x)
            dirY = elementDirection(dirY, y)
        }
        checkPosition()
        console.log(`Player right position X: ${playerRight.x} and Y: ${playerRight.y}`)
    }

    //console.log(`Ball speed: ${speed} and position x: ${x}, y: ${y}`)

    // create scores and and sets initial move to true
    function checkPosition() {
        if(x > 780.00) {
            playerLeftScore++
            x = 390.00
            y = 390.00
            isMoveInitial = true
        }else if(x < 10.00) {
            playerRightScore++
            x = 390.00
            y = 390.00
            isMoveInitial = true
        }else{
            return
        }
    }

    // Create a temporary players and a ball with array values, to be able to know if the player is moving in and angle or straight
    function elementDirection (el,val) {
        el.push(val)
        if(el.length > 3){
           el.shift()
           return el
        }else{
            return el
        }
    }
}
