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
    property string rain: "Rain: -"
    property string humidity: "H: -"
    property string condition: "-"
    property string conditionAtTime: "-"
    property bool lineVisible: true
    property real scaleFactor: 1.0

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
        id: mainRectangle
        width: parent.width
        height: parent.height
        color: "transparent"

        Rectangle {
            id: dayOfWeek
            width: parent.width
            height: 25
            color: "transparent"

            Text {
                id: txtDayOfWeek
                width: parent.width
                color: "#FA9727"
                font.bold: true
                font.pointSize: 25
                font.family: fontc059Bold.name
                horizontalAlignment: Text.AlignHCenter
                text: forecast.dayOfWeek
            }
        }

        Rectangle {
            id: rectLeft
            color: "transparent"
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter

            Image {
                id: imgWeather
                //anchors.verticalCenter: recImgWeather.verticalCenter
                source: "qrc:/images/113.png"
                scale: forecast.scaleFactor
            }
        }

//TODO: center this text
        Rectangle {
            id: rectCenter
            color: "transparent"
            width: parent.width

            Column {
                id: colRectCenter
                Text {
                    id: txtCondition
                    color: "#ffffff"
                    font.bold: true
                    font.pointSize: 13
                    font.family: fontc059Bold.name
                    text: forecast.condition
                }
            }
        }

        Rectangle {
            id: rectRight
            color: "transparent"
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
