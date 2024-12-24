import QtQuick

Window {
    id: mainWindow
    width: 800
    height: 480
    visible: true
    title: qsTr("Hello World")

    // Fonts
    FontLoader {
        id: fontHelveticaSemibold
        source: "qrc:/fonts/Helvetica-Black-SemiBold.ttf"
    }
    FontLoader {
        id: fontOpenSans
        source: "qrc:/fonts/OpenSans-Light.ttf"
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            time.text = Qt.formatDateTime(new Date(), "hh:mm:ss")
            date.text = Qt.formatDateTime(new Date(), "dddd dd MMMM")
        }
    }

    Rectangle {
        id: rectDateTime
        width: parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        color: "#233343"

        // Time
        Rectangle {
            id: rectTime
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 25
            width: parent.width
            height: 100
            color: "transparent"

            Text {
                id: time
                text: qsTr("10:25")
                anchors.centerIn: parent
                color: "white"
                font.pointSize: 80
                font.family: fontOpenSans.name
            }
        }

        //Date
        Rectangle {
            id: rectDate
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: rectTime.bottom
            width: parent.width
            height: 60
            color: "transparent"
            Text {
                id: date
                text: qsTr("March 25 2020")
                anchors.centerIn: parent
                color: "white"
                font.pointSize: 25
                font.family: fontOpenSans.name
            }
        }

        //Today Weather
        ItemWeather {
            id: weather0
            height: 130
            width: 150
            anchors.top: rectDate.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            scaleFactor: 1.8
            lineVisible: false
        }

        //Weather from tomorrow
        Rectangle {
            width: parent.width
            height: 150
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            color: "transparent"

            Rectangle {
                id: horizontalLine
                height: 1
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                border.width: 1
                border.color: "white"
            }

            ItemWeather {
                id: weather1
                width: parent.width * 0.25
                height: parent.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                dayOfWeek: qsTr("Monday")
                lineVisible: false
            }

            ItemWeather {
                id: weather2
                width: parent.width * 0.25
                height: parent.width
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: weather1.right
                dayOfWeek: qsTr("Tuesday")
                lineVisible: false
            }
        }
    }
    // the invisible button
    Rectangle {
        id: btnRequest
        width: 120
        height: 50
        anchors.top: parent.top
        anchors.right: parent.right
        color: "red"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                appBridge.restApiRequest();
            }
        }
    }
    Connections {
        target: appBridge
        function onDataChanged() {
            //Today
            //weather0.setIcon(appBridge.JsondData.DailyForecasts[0]);
            weather0.tempMin = "Min: " + appBridge.JsonData.weather[0].mintempC + " °C";
            weather0.tempMax = "Max: " + appBridge.JsonData.weather[0].maxtempC + " °C";

            // //Today + 1
            // var date = new Date(appBridge.JsonData.DailyForecasts[1].EpochDate * 100);
            weather1.tempMin = "Min: " + appBridge.JsonData.weather[1].mintempC + " °C";
            weather1.tempMax = "Max: " + appBridge.JsonData.weather[1].maxtempC + " °C";
            //weather1.dayOfWeek = Qt.formatDateTime(date, "dddd");
            // weather1.setIcon(appBridge.JsondData.DailiForecast[1].Day.Icon)
            // weather1.tempMin = appBridge.JsonData.DailyForecasts[1].Temperature.Minimum.Value + " °C";
            // weather1.tempMax = appBridge.JsonData.DailyForecasts[1].Temperature.Maximum.Value + " °C";

            // //Today + 2
            // var date = new Date(appBridge.JsonData.DailyForecasts[2].EpochDate * 100);
            weather2.tempMin = "Min: " + appBridge.JsonData.weather[2].mintempC + " °C";
            weather2.tempMax = "Max: " + appBridge.JsonData.weather[2].maxtempC + " °C";
            // weather2.dayOfWeek = Qt.formatDateTime(date, "dddd");
            // weather2.setIcon(appBridge.JsondData.DailiForecast[2].Day.Icon)
            // weather2.tempMin = appBridge.JsonData.DailyForecasts[2].Temperature.Minimum.Value + " °C";
            // weather2.tempMax = appBridge.JsonData.DailyForecasts[2].Temperature.Maximum.Value + " °C";
        }
    }
}
