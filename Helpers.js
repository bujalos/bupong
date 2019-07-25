
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
function setBallBounce(ball, player, topWall, bottomWall) {
    if(player.direction === "cons" && ball.direction === "cons") {
        ball.y = ball.y
        return
    }
    if(player.direction === "cons" && ball.direction === "inc") {
        ball.y++
        ball.speed = ball.speed / 1.2
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

function checkCollision(ball, playerR, playerL) {
    if(ball.x === 770 || ball.x === 20 ) {
        if(ball.y >= playerL.y && ball.y <= playerL.y + 80) {
            return true
        }else if(ball.y >= playerR.y && ball.y <= playerR.y + 80) {
            return true
        }else{
            return false
        }
    }
}
