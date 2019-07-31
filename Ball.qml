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
    property bool collision: false
    property string collisionSide: "none"

    x: 390.00
    y: 390.00

    // sets initial move on the beginnig and after each score
    function initMove(valX,valY) {
        speed = 1.0
        // initial ball movement
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
        checkCollision(ballMain,playerRight,playerLeft)
        checkPosition()
    }

    function move() {
        var topWall = 0.0;
        var bottomWall = 800.0;
        checkCollision(ballMain,playerRight,playerLeft)
        var tempPlayer = collisionSide === "left" ? playerLeft : playerRight
        setBallBounce(ballMain, tempPlayer, topWall, bottomWall)
        checkPosition()
    }

    function setBallBounce(ball, player, topWall, bottomWall) {
        var valX = 1
        var valY = 1

        // set X direction
        if(collisionSide === "left") {
            ball.x += (valX * ball.speed)
        }else if(collisionSide === "right"){
            ball.x -= (valX * ball.speed)
        }

        // set Y direction
        if(player.direction === "cons" && ball.direction === "cons") {
            //ball.speed =  ball.speed - 0.2
            return
        }
        if(player.direction === "cons" && ball.direction === "dec") {
            if(checkSideCollisions()) {
                ball.y++
                return
            }
            ball.y--
            ball.speed = 0.8
            return
        }
        if(player.direction === "cons" && ball.direction === "inc") {
            if(checkSideCollisions()) {
                ball.y--
                return
            }
            ball.y++
            return
        }
        if(player.direction === "inc" && ball.direction === "cons") {
            ball.y++
            ball.speed = 1.2
            return
        }
        if(player.direction === "inc" && ball.direction === "dec") {
            if(checkSideCollisions()) {
                ball.y++
                return
            }
            ball.y++
            ball.speed = 0.8
            return
        }
        if(player.direction === "inc" && ball.direction === "inc") {
            if(checkSideCollisions()) {
                ball.y--
                return
            }
            ball.y++
            ball.speed = 0.8
            return
        }
        if(player.direction === "dec" && ball.direction === "cons") {
            ball.y--
            ball.speed = 1.2
            return
        }

        if(player.direction === "dec" && ball.direction === "inc") {
            if(checkSideCollisions()) {
                ball.y--
                return
            }
            ball.y--
            ball.speed = 0.8
            return
        }
        if(player.direction === "dec" && ball.direction === "dec") {
            if(checkSideCollisions()) {
                ball.y++
                return
            }
            ball.y--
            ball.speed = 1.2
            return
        }
    }

    // create scores and and sets initial move to true
    function checkPosition() {
        dirY = Helpers.getElementDirection(dirY, y)
        if(ballMain.x >= 766.00) {
            console.log(`Ball X:${x}, Y:${y}`)
            ballMain.playerLeftScore++
            ballMain.x = 390.00
            ballMain.y = 390.00
            ballMain.isMoveInitial = true
        }else if(ballMain.x <= 23.00) {
            console.log(`Ball X:${x}, Y:${y}`)
            ballMain.playerRightScore++
            ballMain.x = 390.00
            ballMain.y = 390.00
            ballMain.isMoveInitial = true
        }
    }

    function checkCollision(ball, playerR, playerL) {
        if((ball.x >= 762) && (ball.x <= 765.999) && (ball.y >= playerR.y && ball.y <= playerR.y + 80)) {
            ball.isMoveInitial = false
            playerL.direction = Helpers.setElementDirection(playerL.dirY)
            playerR.direction = Helpers.setElementDirection(playerR.dirY)
            ball.direction = Helpers.setElementDirection(ball.dirY)
            ball.collisionSide = "right"
        }else if((ball.x >= 23.001) && (ball.x <= 25) && (ball.y >= playerL.y && ball.y <= playerL.y + 80)) {
            ball.isMoveInitial = false
            playerL.direction = Helpers.setElementDirection(playerL.dirY)
            playerR.direction = Helpers.setElementDirection(playerR.dirY)
            ball.direction = Helpers.setElementDirection(ball.dirY)
            ball.collisionSide = "left"
        }
    }

    function checkSideCollisions() {
        if(ballMain.y <= 10 || ballMain.y >= 790) {
            return true
        }
        return false
    }

}
