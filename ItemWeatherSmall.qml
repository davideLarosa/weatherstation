import QtQuick

Rectangle {
    id: forecast
    property string dayOfWeek: " "
    property string feelsLike: "-"
    property string unit: " °C"
    property string tempFeels: "Feels: --.-"
    property string tempMin: "Min: --.-"
    property string tempMax: "Max: --.-"
    property string tempAvg: "Avg: --.-"
    property string rainPercent: "Rain: -"
    property string rainMm: "-"
    property string windPercent: "Wind: -"
    property string windKmH: "-"
    property string humidity: "Humidity: -"
    property string condition: "-"
    property string conditionAtTime: "-"
    property bool lineVisible: true
    property real scaleFactor: 1.0
    property real textSize: 20

    color: "transparent"

    function setIcon(value){
        imgWeather.source="qrc:/images/"+value+".png"
    }

    function getHourIndex () {
        let code=0;
        let curTime = new Date().getHours()*100;

        if (curTime >= 0 && curTime < 300) {
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
        id: dayOfWeek
        width: parent.width
        height: 35
        color: "transparent"

        Text {
            id: txtDayOfWeek
            width: parent.width
            color: "#FA9727"
            font.bold: true
            font.pointSize: forecast.textSize
            font.family: fontc059Bold.name
            horizontalAlignment: Text.AlignHCenter
            text: forecast.dayOfWeek
        }
    }

    Rectangle {
        id: rectImage
        //anchors.left: parent.left
        height: parent.height - dayOfWeek.height
        anchors.top: dayOfWeek.bottom
        width: 130
        color: "transparent"

        Image {
            id: imgWeather
            anchors.top: parent.top
            anchors.topMargin: 5
            //anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/images/113.png"
            scale: forecast.scaleFactor
        }
        Text {
            id: txtCondition
            anchors.top: imgWeather.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            color: "#ffffff"
            font.bold: true
            font.pointSize: forecast.textSize
            font.family: fontc059Bold.name
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            text: forecast.condition
        }

        Text {
            id: txtCurrTemp
            anchors.top: txtCondition.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            color: "#ffffff"
            font.bold: true
            font.pointSize: forecast.textSize - 5
            font.family: fontc059Bold.name
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            text: forecast.conditionAtTime + forecast.unit
        }
    }

    Rectangle {
        id: rectCenter
        height: parent.height - dayOfWeek.height
        width: 200
        anchors.left: rectImage.right
        anchors.top: dayOfWeek.bottom
        color: "transparent"

        Column {
            id: colTempMinAvgMax
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter

            Row {
                id: rowTempMin
                Text {
                    id: txtTempMin
                    font.family: fontc059Bold.name
                    font.bold: true
                    font.pointSize: forecast.textSize
                    color: "#3ecdfd"
                    text: forecast.tempMin + forecast.unit + "  "
                }
            }
            Row {
                id: rowTempAvg
                Text {
                    id: txtTempAvg
                    font.family: fontc059Bold.name
                    font.bold: true
                    font.pointSize: forecast.textSize
                    color: "#ffffff"
                    text: forecast.tempAvg + forecast.unit + "  "
                }
            }

            Row {
                id: rowTempMax
                Text {
                    id: txtTempMax
                    font.family: fontc059Bold.name
                    font.bold: true
                    font.pointSize: forecast.textSize
                    color: "#fb5255"
                    text: forecast.tempMax + forecast.unit
                }
            }

            Row {
                id: rowRainPercent
                Text {
                    id: txtRainPercent
                    font.family: fontc059Bold.name
                    font.bold: true
                    font.pointSize: forecast.textSize
                    color: "white"
                    text: forecast.rainPercent + "%  "
                }
            }
        }
    }

    Rectangle {
        id: rectRight
        height: parent.height - dayOfWeek.height
        width: parent.width - rectImage.width - rectCenter.width
        //anchors.leftMargin: 15
        anchors.left: rectCenter.right
        anchors.top: dayOfWeek.bottom
        color: "transparent"
        
        Column {
            id: colRectRight

            Row {
                id: rowHumidity
                Text {
                    id: txtHumidity
                    font.family: fontc059Bold.name
                    font.bold: true
                    font.pointSize: forecast.textSize - 7
                    color: "white"
                    text: forecast.humidity + "%"
                }
            }

            Row {
                id: rowRain
                Text {
                    id: txtRainMm
                    font.family: fontc059Bold.name
                    font.bold: true
                    font.pointSize: forecast.textSize - 7
                    color: "white"
                    text: forecast.rainMm + "mm"
                }
            }

            Row {
                id: rowWind
                Text {
                    id: txtWindPecent
                    font.family: fontc059Bold.name
                    font.bold: true
                    font.pointSize: forecast.textSize - 7
                    color: "white"
                    text: forecast.windPercent + "%  "
                }
                Text {
                    id: txtWindKmH
                    font.family: fontc059Bold.name
                    font.bold: true
                    font.pointSize: forecast.textSize - 7
                    color: "white"
                    text: forecast.windKmH + "km/h"
                }
            }
        }
    }


//    Rectangle {
//        id: rectDayOfWeek
//        anchors.horizontalCenter: parent.horizontalCenter
//
//        Text {
//            id: txtDayOfWeek
//            anchors.top: parent.top
//            color: "#FA9727"
//            font.bold: true
//            font.pointSize: 25
//            font.family: fontc059Bold.name
//            horizontalAlignment: Text.AlignHCenter
//            text: forecast.dayOfWeek
//        }
//    }
//
//    Rectangle {
//        id: recImgWeather
//        height: parent.height
//        anchors.top: rectDayOfWeek.bottom
//
//        Image {
//            id: imgWeather
//            anchors.verticalCenter: recImgWeather.verticalCenter
//            source: "qrc:/images/113.png"
//            scale: forecast.scaleFactor
//        }
//    }
//
//    Rectangle {
//        id: condition
//        anchors.top: imgWeather.bottom
//        width: imgWeather.width
//        anchors.horizontalCenter: imgWeather.horizontalCenter
//        anchors.horizontalCenterOffset: 15
//        color: "transparent"
//
//        Text {
//            id: txtCondition
//            color: "#ffffff"
//            anchors.rightMargin: 15
//            anchors.topMargin: 15
//            font.bold: true
//            font.pointSize: 13
//            font.family: fontc059Bold.name
//            text: forecast.condition
////        }
//        Rectangle {
//            id: conditionAtTime
//            anchors.top: txtCondition.bottom
//            width: txtCondition.width
//            color: "transparent"
//
//            Text {
//                id: txtConditionAtTime
//                color: "#ffffff"
//                anchors.rightMargin: 15
//                anchors.topMargin: 15
//                font.bold: true
//                font.pointSize: 13
//                font.family: fontc059Bold.name
//                text: forecast.conditionAtTime + forecast.unit
//            }
//        }
//    }
//    Rectangle {
//        id: rectTemperatures
//        height: parent.height
//        width: parent.width
//        anchors.top: parent.top
//        anchors.topMargin: 10 * forecast.scaleFactor
//        anchors.horizontalCenter: parent.horizontalCenter
//        color: "transparent"
//
//        Column {
//            id: colTemp_table
//            height: parent.height
//            width: parent.width/2
//            anchors.right: parent.right
//            anchors.top: parent.top
//            anchors.rightMargin: 25
//
//            Text {
//                id: txtTempAvg
//                color: "#ffffff"
//                //anchors.top: txtTempFeels.bottom
//                anchors.rightMargin: 5
//                anchors.topMargin: 15
//                font.bold: true
//                font.pointSize: 13
//                font.family: fontc059Bold.name
//                text: forecast.tempAvg + forecast.unit
//            }
//            Text {
//                id: txtTempMin
//                color: "#3ecdfd"
//                anchors.top: txtTempAvg.bottom
//                anchors.rightMargin: 5
//                anchors.topMargin: 5
//                font.bold: true
//                font.pointSize: 13
//                font.family: fontc059Bold.name
//                text: forecast.tempMin + forecast.unit
//            }
//            Text {
//                id: txtTempMax
//                color: "#fb5255"
//                anchors.top: txtTempMin.bottom
//                anchors.rightMargin: 5
//                anchors.topMargin: 5
//                font.bold: true
//                font.pointSize: 13
//                font.family: fontc059Bold.name
//                text: forecast.tempMax + forecast.unit
//            }
//            Text {
//                id: txtRain
//                color: "white"
//                anchors.top: txtTempMax.bottom
//                anchors.rightMargin: 5
//                anchors.topMargin: 5
//                font.bold: true
//                font.pointSize: 13
//                font.family: fontc059Bold.name
//                text: forecast.rain + "%"
//            }
//            Text {
//                id: txtHumidity
//                color: "white"
//                anchors.top: txtRain.bottom
//                anchors.rightMargin: 5
//                anchors.topMargin: 5
//                font.bold: true
//                font.pointSize: 13
//                font.family: fontc059Bold.name
//                text: forecast.humidity + "%"
//            }
//        }
//    }
//
//    Rectangle {
//        id: verticalLine
//        height: parent.height
//        width: 1
//        anchors.verticalCenter: parent.verticalCenter
//        anchors.right: parent.right
//        border.width: 1
//        border.color: "white"
//        visible: forecast.lineVisible
//    }
}
