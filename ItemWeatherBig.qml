import QtQuick

Rectangle {
    id: forecast
    property string feelsLike: "-"
    property string tempCurr: "--.- (-)"
    property string unit: " °C"
    property string tempFeels: "Feels Like: --.-"
    property string tempMin: "L: --.-"
    property string tempMax: "H: --.-"
    property string tempAvg: "A: --.-"
    property string rainPercent: "Rain: -"
    property string rainMm: "-"
    property string humidity: "Humidity: -"
    property string windPercent: "-"
    property string windKmH: "-"
    property string condition: "-"
    property real scaleFactor: 1.0
    property real textSize: 20

    property string sunrise: ""
    property string sunset: ""

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
        width: 437
        height: parent.height
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        color: "transparent"

        Row {
            id: rowHumidity
            anchors.top: parent.top
            anchors.left: parent.left

            Text {
                id: txtHumidity
                font.family: fontc059Bold.name
                font.bold: true
                font.pointSize: forecast.textSize
                color: "white"
                text: forecast.humidity + "%"
            }
        }

        Row {
            id: rowRain
            anchors.top: rowHumidity.bottom
            anchors.left: parent.left

            Text {
                id: txtRainPercent
                font.family: fontc059Bold.name
                font.bold: true
                font.pointSize: forecast.textSize
                color: "white"
                text: forecast.rainPercent + "%  "
            }

            Text {
                id: txtRainMm
                font.family: fontc059Bold.name
                font.bold: true
                font.pointSize: forecast.textSize
                color: "white"
                text: forecast.rainMm + "mm"
            }
        }

        Row {
            id: rowWind
            anchors.top: rowRain.bottom
            anchors.left: parent.left

            Text {
                id: txtWindPecent
                font.family: fontc059Bold.name
                font.bold: true
                font.pointSize: forecast.textSize
                color: "white"
                text: forecast.windPercent + "%  "
            }
            Text {
                id: txtWindKmH
                font.family: fontc059Bold.name
                font.bold: true
                font.pointSize: forecast.textSize
                color: "white"
                text: forecast.windKmH + "km/h"
            }
        }
    }

    Rectangle {
        id: bigWCenter
        //anchors.left: bigWLeft.right
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        width: 140
        height: parent.height
        color: "transparent"

        Image {
            id: imgWeather
            anchors.left: parent.left
        //    anchors.leftMargin: 30
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/images/113.png"
            scale: forecast.scaleFactor
        }
    }

    Rectangle {
        id: bigWRight
        anchors.right: parent.right
        anchors.top: parent.top
        height: parent.height
        width: 437
        color: "transparent"

        Column {
            id: colCurrentTemp
            //width: parent.width
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter

            Text {
                id: txtCurrentTemp
                font.family: fontc059Bold.name
                font.bold: true
                font.pointSize: forecast.textSize+20
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                text: forecast.tempCurr + forecast.unit
            }
            Text {
                id: txtCurrentCondition
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.left: parent.left
                horizontalAlignment: Text.AlignHCenter
                font.family: fontc059Bold.name
                font.bold: true
                font.pointSize: forecast.textSize
                wrapMode: Text.WordWrap
                color: "white"
                text: forecast.condition
            }
        }

        Column {
            id: colTempMinAvgMax
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter

            Text {
                id: txtTempMin
                font.family: fontc059Bold.name
                font.bold: true
                font.pointSize: forecast.textSize+5
                color: "#3ecdfd"
                text: forecast.tempMin + forecast.unit + "  "
            }
            Text {
                id: txtTempAvg
                font.family: fontc059Bold.name
                font.bold: true
                font.pointSize: forecast.textSize+5
                color: "#ffffff"
                text: forecast.tempAvg + forecast.unit + "  "
            }

            Text {
                id: txtTempMax
                font.family: fontc059Bold.name
                font.bold: true
                font.pointSize: forecast.textSize+5
                color: "#fb5255"
                text: forecast.tempMax + forecast.unit
            }
        }
    }
}
