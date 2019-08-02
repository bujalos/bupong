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
    property bool collisionTopBottom: false
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
        Helpers.checkCollision(ballMain,playerRight,playerLeft)
        Helpers.checkPosition(ballMain)
    }

    function move() {
        var topWall = 0.0;
        var bottomWall = 800.0;
        Helpers.checkCollision(ballMain,playerRight,playerLeft)
        if(collisionSide === "left") {
            setBallBounce(ballMain, playerLeft, topWall, bottomWall)
        }else if(collisionSide === "right"){
            setBallBounce(ballMain, playerRight, topWall, bottomWall)
        }
        Helpers.checkPosition(ballMain)
    }

    function setBallBounce(ball, player, topWall, bottomWall) {
        var valX = 1
        var valY = 1

        // set X direction
        if(ball.collisionSide === "left") {
            ball.x += (valX * ball.speed)
        }else if(ball.collisionSide === "right"){
            ball.x -= (valX * ball.speed)
        }

        if(ball.collisionTopBottom && ball.direction === "dec"){
            ball.y--
            return
        }else if(ball.collisionTopBottom && ball.direction === "inc") {
            ball.y++
            return
        }

        // set Y direction
        if(player.direction === "cons" && ball.direction === "cons") {
            return
        }
        if(player.direction === "cons" && ball.direction === "dec") {
            ball.y--
            ball.speed = 0.8
            return
        }
        if(player.direction === "cons" && ball.direction === "inc") {
            ball.y++
            ball.speed = 0.8
            return
        }
        if(player.direction === "inc" && ball.direction === "cons") {
            ball.y--
            ball.speed = 1.2
            return
        }
        if(player.direction === "inc" && ball.direction === "dec") {
            ball.y--
            ball.speed = 0.8
            return
        }
        if(player.direction === "inc" && ball.direction === "inc") {
            ball.y--
            ball.speed = 1.5
            return
        }
        if(player.direction === "dec" && ball.direction === "cons") {
            ball.y++
            ball.speed = 1.2
            return
        }
        if(player.direction === "dec" && ball.direction === "inc") {
            ball.y++
            ball.speed = 0.8
            return
        }
        if(player.direction === "dec" && ball.direction === "dec") {
            ball.y--
            ball.speed = 1.2
            return
        }
    }
}
