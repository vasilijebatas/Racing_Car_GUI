import QtQuick

Item{
    property alias aliasWaterTemperature: waterTempText.contentWidth
    property int text2: progressBar2.width/2 - watertext.watertemperature/2
    property int waterTemperature: 0
    property int progressBarWidth: progressBarBackground2.width
    width: parent.width - 650
    height: 55
    anchors.top: parent.top
    anchors.topMargin: 250
    anchors.left: parent.left
    anchors.leftMargin: 50

    //Progress Bar
    Rectangle{
        id: progressBarBackground2
        anchors.fill: parent
         color: "cornsilk"

         Text{
             id: insideText2
             text: +waterTemperature + "°C"
             anchors.centerIn: parent
             font.pixelSize: 25
             color:"black"
             z: 1
         }


         Rectangle{
            id: progressBarIndicator2
            width: waterTemperature < 120 ? Math.max(0, (waterTemperature - 40) / 80 * parent.width) : progressBarBackground2.width
            height: parent.height
            color: waterTemperature < 90 ? "chocolate" : "firebrick"
            anchors.top: parent.top
        }
    }

    //Lines
    Rectangle{
        id: line
        border.color: "chocolate"
        width: progressBar2.width
        height: 1.2
        anchors.left: progressBar2.left
        anchors.bottom: progressBar2.top
        anchors.bottomMargin: 2
    }

    Row{
        property int rpmWidth: progressBar2.width
        spacing: rpmWidth/2 - 11
        anchors.bottom: line.top
        anchors.left: line.left
        anchors.bottomMargin: -2

        Repeater{
            model: 2
                Rectangle{
                    id: upRightLine
                    border.color: "chocolate"
                    width: 5
                    height: 1.2
                    transform: Rotation{
                    angle: -90
                    }
             }
        }
    }

    Rectangle{
        id: rightSideUpRightLine
        border.color: "chocolate"
        width: 5
        height: 1.2
        anchors.bottom: line.top
        anchors.right: line.right
        anchors.rightMargin: -5
        anchors.bottomMargin: -2
        transform: Rotation{
            angle: -90
        }
    }

    //Water Numbers
    Row{
        width: progressBar2.width
        height: 30
        anchors.left: progressBar2.left
        anchors.leftMargin: -13
        anchors.bottom: progressBar2.top

        spacing: progressBar2.width/3
        Repeater{
            model: 3
            Text {
                text: (index + 1) * 40
                font.pixelSize: 20
                color: "cornsilk"
            }
        }
    }
    //Water Text

    Text{
        id: waterTempText
        text: "WATER TEMP"
        font.pixelSize: 20
        color:"lightcoral"

        anchors.left: progressBar2.left
        anchors.leftMargin: 15
        anchors.top: progressBar2.bottom
    }
}
