import QtQuick
import QtQuick.Controls
import QtQuick.Window
import Version 1.0

Window {
    width: 800
    height: 480
    visible: true
    title: qsTr("GUI")

    Rectangle{
        id: blackbackground
        width: parent.width
        height: parent.height
        color: "black"

        Progress_Bar{
            id: progressBar
        }

        Progress_Bar2{
            id: progressBar2
        }

        Progress_Bar3{
            id: progressBar3
        }

        Progress_Bar4{
            id: progressBar4
        }

        Progress_Bar5{
            id: progressBar5
        }

        Gear_Number{
            id: gearnumber
            anchors.centerIn: parent
        }

        Speed_Number{
            id: speednumber
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 50
        }

        TcpClass{
            id: server

            Component.onCompleted: {
                server.startServer();
            }

            onNewConnection: {
                console.log("SERVER HAS ACHIEVED NEW CONNECTION \n")
            }

            onDataReceived: {
                console.log("SERVER RECIEVED SOME DATA \n");
                console.log("Data SERVER HAS received:", speed, rpm, waterTemp, fuelLevel, oilTemp, oilPressure, gear);
                speednumber.speedValue = speed;
                progressBar.rpmValue = Math.min(Math.max(rpm, 0), 8000) / 8000 * progressBar.progressBarWidth;
                progressBar2.waterTemperature = waterTemp;
                progressBar3.fuelLevel = fuelLevel;
                progressBar4.oilTemperature = oilTemp;

                var formattedOilPressure = (oilPressure / 10).toFixed(1);
                progressBar5.oilPressure = parseFloat(formattedOilPressure);
                gearnumber.gearValue = gear;
            }
        }
    }
}

