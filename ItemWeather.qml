import QtQuick

Rectangle {
    property string dayOfWeek: " "
    property string unit: " °C"
    property string tempCurr: "Curr: --.-"
    property string tempMin: "Min: --.-"
    property string tempMax: "Max: --.-"
    property bool lineVisible: true
    property real scaleFactor: 1.0

    color: "transparent"

    function setIcon(value){
        imgWeather.source="qrc:/images/"+value+".png"
    }

    Text {
        id: txtDayOfWeek
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: imgWeather.top
        anchors.bottomMargin: 10
        color: "#FA9727"
        font.bold: true
        font.pointSize: 15
        font.family: fontOpenSans.name
        text: dayOfWeek
    }
    Image {
        id: imgWeather
        anchors.centerIn: parent
        source: "qrc:/images/113.png"
        scale: scaleFactor
    }

    Rectangle {
        id: rectTemperatures
        height: 25
        width: parent.width
        anchors.top: imgWeather.bottom
        anchors.topMargin: 10 * scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        color: "transparent"

        Text {
            id: txtTempMin
            anchors.right: parent.horizontalCenter
            anchors.rightMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            color: "#3ecdfd"
            font.bold: true
            font.pointSize: 13
            font.family: fontOpenSans.name
            text: tempMin + unit
        }
        Text {
            id: txtTempMax
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            color: "#fb5255"
            font.bold: true
            font.pointSize: 13
            font.family: fontOpenSans.name
            text: tempMax + unit
        }
        Text {
            id: txtTempCurr
            anchors.left: txtTempMax.right
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            color: "#ffffff"
            font.bold: true
            font.pointSize: 13
            font.family: fontOpenSans.name
            text: tempCurr + unit
        }
    }

    Rectangle {
        id: verticalLine
        height: parent.height
        width: 1
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        border.width: 1
        border.color: "white"
        visible: lineVisible
    }
}
