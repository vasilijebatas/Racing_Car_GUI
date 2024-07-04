import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import Version 1.0

Window {
    width: 640
    height: 480
    visible: true
    color: "gray"
    title: qsTr("Hello World")

    property int speed: 0
    property int rpm: 0
    property int waterTemp: 0
    property int fuelLevel: -10
    property int oilTemp: 0
    property int oilPressure: 0
    property int gear: 0

    Tcp_Client{
        id: client
    }

    Button{
        id: buttonConnect
        text: "connect"
        anchors.centerIn: parent
        onClicked: {
            client.connectToServer("YOUR IP", "1234");
        }
    }

    Button{
        id: buttonSendData
        text: "Send Data"
        anchors.top: buttonConnect.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: buttonConnect.horizontalCenter
        onClicked: {
            console.log("Toggle Animation")
            rpmTimer.running = !rpmTimer.running
            speedTimer.running = !speedTimer.running
            waterTimer.running = !waterTimer.running
            fuelTimer.running = !fuelTimer.running
            oilTempTimer.running = !oilTempTimer.running
            oilPressureTimer.running = !oilPressureTimer.running
            gearTimer.running = !gearTimer.running
        }
    }

    Timer {
        id: rpmTimer
        interval: 1
        repeat: true
        running: false

        property int rpmDirection: 1

        onTriggered: {
            rpm += 4 * rpmDirection

            if ((rpmDirection == 1 && rpm >= 8000) || (rpmDirection == -1 && rpm <= 0)) {
                rpmDirection *= -1;
            }

            client.newMessage(speed, rpm, waterTemp, fuelLevel, oilTemp, oilPressure, gear)
        }
    }

    Timer{
        id: speedTimer
        interval: 10
        repeat: true
        running: false

        property int speedDirection: 1

        onTriggered: {
            speed += 1 * speedDirection

            if ((speedDirection == 1 && speed >= 250) || (speedDirection == -1 && speed <= 0)) {
                speedDirection *= -1;
            }

            client.newMessage(speed, rpm, waterTemp, fuelLevel, oilTemp, oilPressure, gear)
        }
    }

    Timer{
        id: waterTimer
        interval: 35
        repeat: true
        running: false

        property int waterTempDirection: 1

        onTriggered: {
            waterTemp += 2 * waterTempDirection

            if ((waterTempDirection == 1 && waterTemp >= 150) || (waterTempDirection == -1 && waterTemp <= 0)) {
                waterTempDirection *= -1;
            }

            client.newMessage(speed, rpm, waterTemp, fuelLevel, oilTemp, oilPressure, gear)
        }
    }

    Timer{
        id: fuelTimer
        interval: 35
        repeat: true
        running: false

        property int fuelLevelDirection: 1

        onTriggered: {
            fuelLevel += 1 * fuelLevelDirection

            if ((fuelLevelDirection == 1 && fuelLevel >= 60) || (fuelLevelDirection == -1 && fuelLevel <= 0)) {
                fuelLevelDirection *= -1;
            }

            client.newMessage(speed, rpm, waterTemp, fuelLevel, oilTemp, oilPressure, gear)
        }
    }

    Timer{
        id: oilTempTimer
        interval: 15
        repeat: true
        running: false

        property int oilTempDirection: 1

        onTriggered: {
            oilTemp += 1 * oilTempDirection

            if ((oilTempDirection == 1 && oilTemp >= 160) || (oilTempDirection == -1 && oilTemp <= 0)) {
                oilTempDirection *= -1;
            }

            client.newMessage(speed, rpm, waterTemp, fuelLevel, oilTemp, oilPressure, gear)
        }
    }

    Timer{
        id: oilPressureTimer
        interval: 40
        repeat: true
        running: false

        property int oilPressureDirection: 1

        onTriggered: {
            oilPressure +=  oilPressureDirection

            if ((oilPressureDirection == 1 && oilPressure >= 100) || (oilPressureDirection == -1 && oilPressure <= 0)) {
                oilPressureDirection *= -1;
            }

            client.newMessage(speed, rpm, waterTemp, fuelLevel, oilTemp, oilPressure, gear)
        }
    }

    Timer{
        id: gearTimer
        interval: 290
        repeat: true
        running: false

        property int gearDirection: 1

        onTriggered: {
            gear += 1 * gearDirection

            if ((gearDirection == 1 && gear >= 8) || (gearDirection == -1 && gear <= 0)) {
                gearDirection *= -1;
            }

            client.newMessage(speed, rpm, waterTemp, fuelLevel, oilTemp, oilPressure, gear)
        }
    }
}
