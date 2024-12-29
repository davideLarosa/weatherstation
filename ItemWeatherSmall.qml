import QtQuick 2.0

Rectangle {
    id: forecast
    property string itDayOfWeek: ""
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
    property string conditinAtTime: "-"
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

    Text {
        id: txtDayOfWeek
        anchors.horizontalCenter: imgWeather.horizontalCenter
        anchors.horizontalCenterOffset: 10
        anchors.bottom: imgWeather.top
        anchors.bottomMargin: 10
        color: "#FA9727"
        font.bold: true
        font.pointSize: 15
        // font.family: fontOpenSans.name
        text: forecast.dayOfWeek
    }
    Image {
        id: imgWeather
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 15
        source: "qrc:/images/113.png"
        scale: forecast.scaleFactor
    }

    Rectangle {
        id: condition
        anchors.top: imgWeather.bottom
        width: imgWeather.width
        anchors.horizontalCenter: imgWeather.horizontalCenter
        anchors.horizontalCenterOffset: 15
        color: "transparent"

        Text {
            id: txtCondition
            color: "#ffffff"
            anchors.rightMargin: 15
            anchors.topMargin: 15
            font.bold: true
            font.pointSize: 13
            // font.family: fontOpenSans.name
            text: forecast.condition
        }
        Rectangle {
            id: conditionAtTime
            anchors.top: txtCondition.bottom
            width: txtCondition.width
            color: "transparent"

            Text {
                id: txtConditionAtTime
                color: "#ffffff"
                anchors.rightMargin: 15
                anchors.topMargin: 15
                font.bold: true
                font.pointSize: 13
                // font.family: fontOpenSans.name
                text: forecast.conditinAtTime + forecast.unit
            }
        }
    }
    Rectangle {
        id: rectTemperatures
        height: parent.height
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: 10 * forecast.scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        color: "transparent"

        Rectangle {
            id: temp_table
            height: parent.height
            width: parent.width/2
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 25
            color: "transparent"

            // Text {
            //     id: txtTempFeels
            //     color: "#ffffff"
            //     anchors.rightMargin: 15
            //     anchors.topMargin: 15
            //     font.bold: true
            //     font.pointSize: 13
            //     font.family: fontOpenSans.name
            //     text: forecast.tempFeels + forecast.unit
            // }
            Text {
                id: txtTempAvg
                color: "#ffffff"
                //anchors.top: txtTempFeels.bottom
                anchors.rightMargin: 5
                anchors.topMargin: 15
                font.bold: true
                font.pointSize: 13
                // font.family: fontOpenSans.name
                text: forecast.tempAvg + forecast.unit
            }
            Text {
                id: txtTempMin
                color: "#3ecdfd"
                anchors.top: txtTempAvg.bottom
                anchors.rightMargin: 5
                anchors.topMargin: 5
                font.bold: true
                font.pointSize: 13
                // font.family: fontOpenSans.name
                text: forecast.tempMin + forecast.unit
            }
            Text {
                id: txtTempMax
                color: "#fb5255"
                anchors.top: txtTempMin.bottom
                anchors.rightMargin: 5
                anchors.topMargin: 5
                font.bold: true
                font.pointSize: 13
                // font.family: fontOpenSans.name
                text: forecast.tempMax + forecast.unit
            }
            Text {
                id: txtRain
                color: "blue"
                anchors.top: txtTempMax.bottom
                anchors.rightMargin: 5
                anchors.topMargin: 5
                font.bold: true
                font.pointSize: 13
                // font.family: fontOpenSans.name
                text: forecast.rain + "%"
            }
            Text {
                id: txtHumidity
                color: "blue"
                anchors.top: txtRain.bottom
                anchors.rightMargin: 5
                anchors.topMargin: 5
                font.bold: true
                font.pointSize: 13
                // font.family: fontOpenSans.name
                text: forecast.humidity + "%"
            }
        }

        // Text {
        //     id: txtTempMin
        //     anchors.right: parent.horizontalCenter
        //     anchors.rightMargin: 15
        //     anchors.verticalCenter: parent.verticalCenter
        //     color: "#3ecdfd"
        //     font.bold: true
        //     font.pointSize: 13
        //     font.family: fontOpenSans.name
        //     text: tempMin
        // }
        // Text {
        //     id: txtTempMax
        //     anchors.left: parent.horizontalCenter
        //     anchors.leftMargin: 15
        //     anchors.verticalCenter: parent.verticalCenter
        //     color: "#fb5255"
        //     font.bold: true
        //     font.pointSize: 13
        //     font.family: fontOpenSans.name
        //     text: tempMax
        // }
    }

    Rectangle {
        id: verticalLine
        height: parent.height
        width: 1
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        border.width: 1
        border.color: "white"
        visible: forecast.lineVisible
    }
}
