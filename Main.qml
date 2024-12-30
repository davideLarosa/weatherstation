import QtQuick

Window {
    id: mainWindow
    width: 1024
    height: 600
    visible: true
    visibility: Window.FullScreen
    title: qsTr("Raspi Weather")
    color: "#233343"


    // Fonts
    FontLoader {
        id: fontHelveticaSemibold
        source: "qrc:/fonts/Helvetica-Black-SemiBold.ttf"
    }
    FontLoader {
        id: fontOpenSans
        source: "qrc:/fonts/OpenSans-Light.ttf"
    }
    FontLoader {
        id: fontc059BoldIta
        source: "qrc:/fonts/C059-BdIta.ttf"
    }
    FontLoader {
        id: fontc059Bold
        source: "qrc:/fonts/C059-Bold.ttf"
    }
    FontLoader {
        id: fontc059Ita
        source: "qrc:/fonts/C059-Italic.ttf"
    }
    FontLoader {
        id: fontc059Roman
        source: "qrc:/fonts/C059-Roman.ttf"
    }

    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            time.text = Qt.formatDateTime(new Date(), "hh:mm:ss")
            date.text = Qt.formatDateTime(new Date(), "dddd dd MMMM")
        }
    }

    // Top rectangle for time and date
    Rectangle {
        id: rectDateTime
        width: parent.width
        height: 240
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        color: "#233343"

        // Time
        Rectangle {
            id: rectTime
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 15
            width: parent.width
            height: 140
            color: "transparent"

            Text {
                id: time
                text: qsTr("--:--:--")
                anchors.centerIn: parent
                color: "white"
                font.pointSize: 120
                font.family: fontc059Bold.name
            }
        }

        //Date
        Rectangle {
            id: rectDate
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: rectTime.bottom
            width: parent.width
            height: 90
            color: "transparent"

            Text {
                id: date
                text: qsTr("-- -- ----")
                anchors.centerIn: parent
                color: "white"
                font.pointSize: 40
                font.family: fontc059Bold.name
            }
        }
    }

    // draw a white line
    Rectangle {
        id: recW0horizontalLine
        height: 1
        width: mainWindow.width
        anchors.top: rectDateTime.bottom
        anchors.horizontalCenter: rectDateTime.horizontalCenter
        border.width: 1
        border.color: "white"
        visible: true
    }

    // central line for today weather
    Rectangle {
        id: rectWeather0
        width: parent.width
        height: 140
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: recW0horizontalLine.bottom
        anchors.left: parent.left
        color: "transparent"

        //Today Weather
        ItemWeatherBig {
            id: weather0
            height: parent.height
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            scaleFactor: 3.5
        }
    }

    Rectangle {
        id: recAddWhorizontalLine
        height: 1
        anchors.top: rectWeather0.bottom
        width: parent.width
        border.width: 1
        border.color: "white"
        visible: true
    }

   Rectangle {
        id: rectAdditionaWeather
        width: parent.width
        height: 220
        anchors.top: rectWeather0.bottom
        color: "transparent"

    //     // Additions
    //     Rectangle {
    //         id: lower_line
    //         height: parent.height/4
    //         width: parent.width
    //         anchors.horizontalCenter: parent.horizontalCenter
    //         anchors.bottom: parent.bottom
    //         color: "transparent"

             Rectangle {
                 id: lower_line_left
                 anchors.verticalCenter: parent.verticalCenter
                 anchors.bottom: parent.bottom
                 anchors.left: parent.left
                 height: parent.height
                 width: parent.width/2
                 color: "transparent"

                 ItemWeatherSmall {
                     id: weather1
                     width: parent.width
                     height: parent.height
                     anchors.verticalCenter: parent.verticalCenter
                     anchors.left: parent.left
                     dayOfWeek: qsTr("--")
                     lineVisible: false
                 }
             }

            Rectangle {
                id: lower_line_right
                anchors.verticalCenter: parent.verticalCenter
                anchors.bottom: parent.bottom
                anchors.left: lower_line_left.right
                height: parent.height
                width: parent.width/2
                color: "transparent"


                ItemWeatherSmall {
                    id: weather2
                    width: parent.width
                    height: parent.height
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    dayOfWeek: qsTr("--")
                    lineVisible: false
                }
            }
        }
 //   }
    // the invisible button
 //   Rectangle {
 //       id: btnRequest
 //       width: 120
 //       height: 50
 //       anchors.top: parent.top
 //       anchors.right: parent.right
 //       color: "red"
 //       MouseArea {
 //           anchors.fill: parent
 //           onClicked: {
 //               appBridge.restApiRequest();
 //           }
 //       }
 //   }
    Connections {
        target: appBridge
        function onDataChanged() {
            //Today
            weather0.tempMin = "L: " + appBridge.JsonData.weather[0].mintempC;
            weather0.tempMax = "H: " + appBridge.JsonData.weather[0].maxtempC;
            weather0.tempAvg = "A: " + appBridge.JsonData.weather[0].avgtempC;
            //weather0.tempCurr = "Current Temp: " + appBridge.JsonData.current_condition[0].temp_C;
            //weather0.tempFeels = "Feels like: " + appBridge.JsonData.current_condition[0].FeelsLikeC;
            weather0.tempCurr = appBridge.JsonData.weather[0].hourly[weather0.getHourIndex()].tempC + " (" + appBridge.JsonData.weather[0].hourly[weather0.getHourIndex()].FeelsLikeC + ")"
            weather0.humidity = "Humidity: " + appBridge.JsonData.weather[0].hourly[weather0.getHourIndex()].humidity;
            weather0.rainPercent = "Rain: " + appBridge.JsonData.weather[0].hourly[weather0.getHourIndex()].chanceofrain;
            weather0.rainMm = appBridge.JsonData.weather[0].hourly[weather0.getHourIndex()].precipMM;
            weather0.windPercent = "Wind: " + appBridge.JsonData.weather[0].hourly[weather0.getHourIndex()].chanceofwindy;
            weather0.windKmH = appBridge.JsonData.weather[0].hourly[weather0.getHourIndex()].windspeedKmph;
            weather0.setIcon(appBridge.JsonData.current_condition[0].weatherCode)

            // //Today + 1
            var date = new Date(appBridge.JsonData.weather[1].date);
            weather1.dayOfWeek = Qt.formatDateTime(date, "dddd");
            weather1.tempMin = "Min: " + appBridge.JsonData.weather[1].mintempC;
            weather1.tempMax = "Max: " + appBridge.JsonData.weather[1].maxtempC;
            weather1.tempAvg = "Avg: " + appBridge.JsonData.weather[1].avgtempC;
            weather1.conditinAtTime = appBridge.JsonData.weather[1].hourly[weather1.getHourIndex()].tempC + " (" + appBridge.JsonData.weather[1].hourly[weather1.getHourIndex()].FeelsLikeC + ")"
            //weather1.tempFeels = "Feels: " + appBridge.JsonData.weather[1].hourly[weather1.getHourIndex()].FeelsLikeC;
            weather1.rain = "Rain: " + appBridge.JsonData.weather[1].hourly[weather1.getHourIndex()].chanceofrain;
            weather1.humidity = "H: " + appBridge.JsonData.weather[1].hourly[weather1.getHourIndex()].humidity;
            weather1.condition = appBridge.JsonData.weather[1].hourly[weather1.getHourIndex()].weatherDesc[0].value;
            weather1.setIcon(appBridge.JsonData.weather[1].hourly[weather1.getHourIndex()].weatherCode)

            // //Today + 2
            var date = new Date(appBridge.JsonData.weather[2].date);
            weather2.dayOfWeek = Qt.formatDateTime(date, "dddd");
            weather2.tempMin = "Min: " + appBridge.JsonData.weather[2].mintempC;
            weather2.tempMax = "Max: " + appBridge.JsonData.weather[2].maxtempC;
            weather2.tempAvg = "Avg: " + appBridge.JsonData.weather[2].avgtempC;
            weather2.conditinAtTime = appBridge.JsonData.weather[2].hourly[weather2.getHourIndex()].tempC + " (" + appBridge.JsonData.weather[2].hourly[weather2.getHourIndex()].FeelsLikeC + ")"
            //weather2.tempFeels = "Feels: " + appBridge.JsonData.weather[2].hourly[weather2.getHourIndex()].FeelsLikeC;
            weather2.rain = "Rain: " + appBridge.JsonData.weather[2].hourly[weather2.getHourIndex()].chanceofrain;
            weather2.humidity = "H: " + appBridge.JsonData.weather[2].hourly[weather2.getHourIndex()].humidity ;
            weather2.condition = appBridge.JsonData.weather[2].hourly[weather2.getHourIndex()].weatherDesc[0].value;
            weather2.setIcon(appBridge.JsonData.weather[2].hourly[weather2.getHourIndex()].weatherCode)

        }
    }
}
