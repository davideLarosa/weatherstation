import QtQuick

Item {
    property string visible: "true"
    id: item

    Rectangle {
        id: horizontalLine
        height: 1
        width: parent.width
        border.width: 1
        border.color: "white"
        visible: item.visible
    }
}
