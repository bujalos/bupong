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
    property string collision: "none"

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
            direction = Helpers.setElementDirection(dirY)
        }else if(playerRightScore > playerLeftScore) {
            x -= (valX * speed)
            y -= (valY * speed)
            dirX = Helpers.getElementDirection(dirX, x)
            dirY = Helpers.getElementDirection(dirY, y)
            direction = Helpers.setElementDirection(dirY)
        }else{
            x += (valX * speed)
            y += (valY * speed)
            dirX = Helpers.getElementDirection(dirX, x)
            dirY = Helpers.getElementDirection(dirY, y)
            direction = Helpers.setElementDirection(dirY)
        }
        checkPosition()        
        console.log(`Player right position X: ${playerRight.x} and Y: ${playerRight.y}`)
    }

    function move() {
      var topWall = 0.0;
      var bottomWall = 800.0;

      var tempPlayer = collision === "left" ? playerLeft : playerRight
      setBallBounce(ballMain, tempPlayer, topWall, bottomWall)
      checkPosition()
    }

    function setBallBounce(ball, player, topWall, bottomWall) {
        var valX = 1
        var valY = 1
        // set X direction
        if(ball.collision === "left") {
            ball.x += (valX * ball.speed)
        }else{
            ball.x -= (valX * ball.speed)
        }
        // set Y direction
        if(player.direction === "cons" && ball.direction === "cons") {
            //ball.speed =  ball.speed - 0.2
            return
        }
        if(player.direction === "inc" && ball.direction === "cons") {
            ball.y++
            ball.speed = speed * 1.2
            return
        }
        if(player.direction === "dec" && ball.direction === "cons") {
            ball.y--
            ball.speed = ball.speed * 1.2
            return
        }
        if(player.direction === "cons" && ball.direction === "inc") {
            ball.y++
            return
        }
        if(player.direction === "cons" && ball.direction === "dec") {
            ball.y--
            ball.speed = ball.speed / 1.2
            return
        }
        if(player.direction === "dec" && ball.direction === "inc") {
            ball.y--
            ball.speed = ball.speed / 1.2
            return
        }
        if(player.direction === "inc" && ball.direction === "dec") {
            ball.y++
            ball.speed = ball.speed / 1.2
            return
        }
        if(player.direction === "inc" && ball.direction === "inc") {
            ball.y++
            ball.speed = ball.speed * 1.2
            return
        }
        if(player.direction === "dec" && ball.direction === "dec") {
            ball.y--
            ball.speed = ball.speed * 1.2
            return
        }
    }


    //console.log(`Ball speed: ${speed} and position x: ${x}, y: ${y}`)

    // create scores and and sets initial move to true
    function checkPosition() {
        checkCollision(ballMain,playerRight,playerLeft)
        if(x > 770.00) {
            ballMain.playerLeftScore++
            ballMain.x = 390.00
            ballMain.y = 390.00
            ballMain.isMoveInitial = true
        }else if(x < 20.00) {
            ballMain.playerRightScore++
            ballMain.x = 390.00
            ballMain.y = 390.00
            ballMain.isMoveInitial = true
        }else{

        }
    }

    function checkCollision(ball, playerR, playerL) {
        if(ball.x === 762 || ball.x === 22 ) {
            if(ball.y >= playerL.y && ball.y <= playerL.y + 80 || ball.y >= playerR.y && ball.y <= playerR.y + 80) {
                ball.isMoveInitial = false
                ball.collision = ball.x === 762 ? "right" : "left"
            }
        }
    }

}
