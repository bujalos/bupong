
// Create a temporary players and a ball with array values, to be able to know if the player is moving in and angle or straight
function getElementDirection(el,val) {
    el.push(val)
    if(el.length > 3){
        el.shift()
        return el
    }else{
        return el
    }
}

// Get direction as increment, decrement or constant
function setElementDirection(el) {
    if (el.length === 3) {
        if(el[0] < el[2]) {
            return "dec"
        }
        if(el[0] > el[2]) {
            return "inc"
        }
        if(el[0] === el[2]) {
            return 'cons'
        }
    }
}

// calculate ball bounce angle and speed


function checkCollision(ball, playerR, playerL) {
    if((ball.x >= 762) && (ball.x <= 765.999) && (ball.y >= playerR.y && ball.y <= playerR.y + 80)) {
        ball.isMoveInitial = false
        playerL.direction = Helpers.setElementDirection(playerL.dirY)
        playerR.direction = Helpers.setElementDirection(playerR.dirY)
        ball.direction = Helpers.setElementDirection(ball.dirY)
        ball.collisionSide = "right"
        ball.collisionTopBottom = false
    }else if((ball.x >= 23.001) && (ball.x <= 25) && (ball.y >= playerL.y && ball.y <= playerL.y + 80)) {
        ball.isMoveInitial = false
        playerL.direction = Helpers.setElementDirection(playerL.dirY)
        playerR.direction = Helpers.setElementDirection(playerR.dirY)
        ball.direction = Helpers.setElementDirection(ball.dirY)
        ball.collisionSide = "left"
        ball.collisionTopBottom = false
    }else if(ball.y <= 0 || ball.y >= 780) {
        ball.isMoveInitial = false
        ball.collisionTopBottom = true
        playerL.direction = Helpers.setElementDirection(playerL.dirY)
        playerR.direction = Helpers.setElementDirection(playerR.dirY)
        ball.direction = Helpers.setElementDirection(ball.dirY)
    }
}

// create scores and and sets initial move to true
function checkPosition(ball) {
    ball.dirY = Helpers.getElementDirection(ball.dirY, ball.y)
    if(ball.x >= 766.00) {
        ball.playerLeftScore++
        ball.x = 390.00
        ball.y = 390.00
        ball.isMoveInitial = true
    }else if(ball.x <= 23.00) {
        ball.playerRightScore++
        ball.x = 390.00
        ball.y = 390.00
        ball.isMoveInitial = true
    }
}
