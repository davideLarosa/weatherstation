import QtQuick

Rectangle {
    id: forecast
    property string feelsLike: "-"
    property string tempCurr: "Current Temp: --.-"
    property string unit: " °C"
    property string tempFeels: "Feels Like: --.-"
    property string tempMin: "Min: --.-"
    property string tempMax: "Max: --.-"
    property string tempAvg: "Avg: --.-"
    property string rain: "Rain: -"
    property string humidity: "H: -"
    property string condition: "-"
    property string conditinAtTime: "-"
    property real scaleFactor: 1.0

    color: "transparent"

    function setIcon(value){
        imgWeather.source="qrc:/images/"+value+".png"
    }

    function getHourIndex () {
        let code=0;
        let curTime = new Date().getHours()*100;

        if (curTime >= 1 && curTime < 300) {
            code=0
        }
        else if (curTime >= 300 && curTime < 600) {
            code=1
        }
        else if (curTime >= 600 && curTime < 900) {
            code=2
        }
        else if (curTime >= 900 && curTime < 1200) {
            code=3
        }
        else if (curTime >= 1200 && curTime < 1500) {
            code=4
        }
        else if (curTime >= 1500 && curTime < 1800) {
            code=5
        }
        else if (curTime >= 1800 && curTime < 2100) {
            code=6
        }
        else if ( curTime >= 2100 ) {
            code=7
        }
        return code;
    }

    Rectangle {
        id: bigWLeft
        width: 150
        height: parent.height
        anchors.left: parent.left
        anchors.top: parent.top
        color: "yellow"

        Image {
            id: imgWeather
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/images/113.png"
            scale: forecast.scaleFactor
        }
    }
    Rectangle {
        id: bigWCenter
        anchors.left: bigWLeft.right
        width: 437
        height: parent.height
        color: "blue"

        Text {
            id: txtCurrentTemp
            width: parent.width
            anchors.left: parent.left
            anchors.top: parent.top
            font.family: fontc059Bold.name
            font.bold: true
            font.pointSize: 25
            color: "white"
            text: forecast.tempCurr + forecast.unit
        } 

        Text {
            id: txtFeelsLike
            width: parent.width
            anchors.top: txtCurrentTemp.bottom
            font.family: fontc059Bold.name
            font.bold: true
            font.pointSize: 25
            color: "white"
            text: forecast.tempFeels + forecast.unit
        } 
    }

    Rectangle {
        id: bigWRight
        anchors.left: bigWCenter.right
        height: parent.height
        width: 437
        color: "red"
    }
}
