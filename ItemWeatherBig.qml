import QtQuick

Rectangle {
    id: forecast
    property string feelsLike: "-"
    property string tempCurr: "Current Temp: --.- (-)"
    property string unit: " °C"
    property string tempFeels: "Feels Like: --.-"
    property string tempMin: "Min: --.-"
    property string tempMax: "Max: --.-"
    property string tempAvg: "Avg: --.-"
    property string rainPercent: "Rain: -"
    property string rainMm: "- %"
    property string humidity: "Humidity: -"
    property string condition: "-"
    property string conditinAtTime: "-"
    property real scaleFactor: 1.0
    property real textSize: 20

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
        color: "transparent"

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
        anchors.top: parent.top
        width: 437
        height: parent.height
        color: "transparent"

        Row {
            id: rowCurrentTemp
            width: parent.width
            anchors.left: parent.left
            anchors.top: parent.top

            Text {
                id: txtCurrentTemp
                font.family: fontc059Bold.name
                font.bold: true
                font.pointSize: forecast.textSize
                color: "white"
                text: forecast.tempCurr + forecast.unit
            }
        }

        //TODO: decide if to use it or not
        //        Text {
        //            id: txtFeelsLike
        //            width: parent.width
        //            anchors.top: txtCurrentTemp.bottom
        //            font.family: fontc059Bold.name
        //            font.bold: true
        //            font.pointSize: forecast.textSize
        //            color: "white"
        //            text: forecast.tempFeels + forecast.unit
        //        }


        Row {
            id: rowHumidity
            anchors.top: rowCurrentTemp.bottom
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
        //Text {
        //    id: txtWind
        //    width: parent.width
        //    anchors.left: parent.left
        //    anchors.top: txtMin.bottom
        //    font.family: fontc059Bold.name
        //    font.bold: true
        //    font.pointSize: forecast.textSize
        //    color: "white"
        //    text: forecast.wind + "km/h"
        //}
    }

    Rectangle {
        id: bigWRight
        anchors.left: bigWCenter.right
        anchors.top: parent.top
        height: parent.height
        width: 437
        color: "transparent"

        Row {
            id: rowTempMinAvgMax
            width: parent.width
            anchors.top: parent.top
            anchors.left: parent.left

            Text {
                id: txtTempMin
                font.family: fontc059Bold.name
                font.bold: true
                font.pointSize: forecast.textSize
                color: "#3ecdfd"
                text: forecast.tempMin + forecast.unit + "  "
            }
            Text {
                id: txtTempAvg
                font.family: fontc059Bold.name
                font.bold: true
                font.pointSize: forecast.textSize
                color: "#ffffff"
                text: forecast.tempAvg + forecast.unit + "  "
            }

            Text {
                id: txtTempMax
                font.family: fontc059Bold.name
                font.bold: true
                font.pointSize: forecast.textSize
                color: "#fb5255"
                text: forecast.tempMax + forecast.unit
            }
        }

    }
}
