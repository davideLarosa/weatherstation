import QtQuick 2.0

Rectangle {
    id: forecast
    property string feelsLike: "-"
    property string tempCurr: "Curr: --.-"
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
        id: verticalLine
        height: 1
        width: parent.width
        anchors.top: parent.top
        border.width: 1
        border.color: "white"
        visible: forecast.lineVisible

        Rectangle {
            id: rectImage
            width: parent.width
            height: 140
            anchors.left: parent.left
            anchors.top: parent.top
            color: "transparent"

            Image {
                id: imgWeather
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10
                source: "qrc:/images/113.png"
                scale: forecast.scaleFactor
            }
        }
    }
}
