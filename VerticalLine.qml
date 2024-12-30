import QtQuick

Item {
    property string visible: "true"

    id: item

    Rectangle {
        id: verticalLine
        height: parent.height
        width: 1
        border.width: 1
        border.color: "white"
        visible: item.visible
    }
}
