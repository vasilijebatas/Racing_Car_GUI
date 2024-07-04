import QtQuick

Item{
    property alias aliasOilTemperature: oilTemperatureText.contentWidth
    property int text4: progressBar4.width/2 - oiltemptext.oiltemperature/2
    property int oilTemperature: 0
    property int progressBarWidth: progressBarBackground4.width
    width: parent.width - 650
    height: 55
    anchors.top: parent.top
    anchors.topMargin: 250
    anchors.right: parent.right
    anchors.rightMargin: 50

    //Progress Bar
    Rectangle{
        id: progressBarBackground4
        anchors.fill: parent
         color: "cornsilk"

         Text{
             id: insidetext4
             text: +oilTemperature + "°C"
             anchors.centerIn: parent
             font.pixelSize: 25
             color:"black"
             z: 1
         }

         Rectangle{
            id: progressBarIndicator4
            width: oilTemperature < 160 ? Math.max(0, (oilTemperature - 60) / 100 * parent.width) : progressBar4.width
            height: parent.height
            color: oilTemperature < 120 ? "chocolate" : "firebrick"
            anchors.top: parent.top
        }
    }

    //Lines
    Rectangle{
        id: line
        border.color: "chocolate"
        width: progressBar4.width
        height: 1.2
        anchors.left: progressBar4.left
        anchors.bottom: progressBar4.top
        anchors.bottomMargin: 2
    }

    Row{
        property int rpmWidth: progressBar4.width
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

    //Oil Temperature Numbers
    Row{
        width: progressBar4.width
        height: 30
        anchors.left: progressBar4.left
        anchors.leftMargin: -12
        anchors.bottom: progressBar4.top

        spacing: progressBar4.width/3 - 6
        Repeater{
            model: 3
            Text {
                text: (index * 50) + 60
                font.pixelSize: 20
                color: "cornsilk"
            }
        }
    }
    //Oil Temperature Text

    Text{
        id: oilTemperatureText
        text: "OIL TEMP"
        font.pixelSize: 20
        color:"lightcoral"

        anchors.left: progressBar4.left
        anchors.leftMargin: 30
        anchors.top: progressBar4.bottom
    }
}
