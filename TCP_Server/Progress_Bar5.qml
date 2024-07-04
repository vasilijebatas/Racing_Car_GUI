import QtQuick

Item{
    property double oilPressure: 0
    property int progressBarWidth: progressBarBackground5.width
    property alias aliasOilPressure: oilPressureText.contentWidth
    property int text5: progressBar5.width/2 - oilpresstext.oilpressure/2
    width: parent.width - 650
    height: 55
    anchors.top: parent.top
    anchors.topMargin: 370
    anchors.right: parent.right
    anchors.rightMargin: 50

    //Progress Bar
    Rectangle{
        id: progressBarBackground5
        anchors.fill: parent
         color: "cornsilk"

         Text{
             id: insidetext5
             text: +oilPressure.toFixed(1)+ " bar"
             anchors.centerIn: parent
             font.pixelSize: 25
             color:"black"
             z: 1
         }

         Rectangle{
            id: progressBarIndicator5
            width: oilPressure < 10 ? Math.max(0, (oilPressure / 10) * parent.width) : parent.width
            height: parent.height
            color: oilPressure < 0.5 || oilPressure > 5 ? "firebrick" : "chocolate"
            anchors.top: parent.top
        }
    }

    //Lines
    Rectangle{
        id: line
        border.color: "chocolate"
        width: progressBar5.width
        height: 1.2
        anchors.left: progressBar5.left
        anchors.bottom: progressBar5.top
        anchors.bottomMargin: 2
    }

    Row{
        property int rpmWidth: progressBar5.width
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

    //Oil Pressure Numbers
    Row{
        width: progressBar5.width
        height: 30
        anchors.left: progressBar5.left
        anchors.leftMargin: -5
        anchors.bottom: progressBar5.top

        spacing: progressBar5.width/3 + 9
        Repeater{
            model: 3
            Text {
                text: index * 5
                font.pixelSize: 20
                color: "cornsilk"
            }
        }
    }

    //Oil Pressure Text
    Text{
        id: oilPressureText
        text: "OIL PRESS"
        font.pixelSize: 20
        color:"lightcoral"

        anchors.left: progressBar5.left
        anchors.leftMargin: 32
        anchors.top: progressBar5.bottom
    }
}
