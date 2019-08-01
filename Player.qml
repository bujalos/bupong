import QtQuick 2.12
import "Helpers.js" as Helpers

PlayerForm {

    property int pressedKey
    property int speed: 3
    property var dirX: []
    property var dirY: []
    property string direction: "cons"
    property var up
    property var down

    property bool moveUp: false
    property bool moveDown: false

    function move() {
        dirY = Helpers.getElementDirection(dirY, y)

        if (moveUp) {
            if (y >= 0) {
                y-= speed
            }
        }

        if (moveDown) {
            if (y <= 725) {
                y+= speed
            }
        }

    }


    Keys.onPressed: {
        if (event.key === up)
            moveUp = true
        if (event.key === down)
            moveDown = true
    }


    Keys.onReleased: {
        if (event.key === up)
            moveUp = false
        if (event.key === down)
            moveDown = false
    }
}
