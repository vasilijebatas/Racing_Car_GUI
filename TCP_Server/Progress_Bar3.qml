import QtQuick

Item{
    property alias aliasFuelLevel: fuelLevelText.contentWidth
    property int text3: progressBar3.width/2 - fueltext.fuellevel/2
    property int fuelLevel: 0
    property int progressBarWidth: progressBarBackground3.width
    width: parent.width - 650
    height: 55
    anchors.top: parent.top
    anchors.topMargin: 370
    anchors.left: parent.left
    anchors.leftMargin: 50

    //Progress Bar
    Rectangle{
        id: progressBarBackground3
        anchors.fill: parent
         color: "cornsilk"

         Text{
             id: insidetext3
             text: if(fuelLevel >= 0){
                   +fuelLevel + "L"
                   }
             anchors.centerIn: parent
             font.pixelSize: 25
             color:"black"
             z: 1
         }

         Rectangle{
            id: progressBarIndicator3
            width: fuelLevel < 60 ? Math.max(0, (fuelLevel / 60) * parent.width) : parent.width
            height: parent.height
            color: "chocolate"
            anchors.top: parent.top
        }
    }

    //Lines
    Rectangle{
        id: line
        border.color: "chocolate"
        width: progressBar3.width
        height: 1.2
        anchors.left: progressBar3.left
        anchors.bottom: progressBar3.top
        anchors.bottomMargin: 2
    }

    Row{
        property int rpmWidth: progressBar3.width
        spacing: rpmWidth/3 - 7
        anchors.bottom: line.top
        anchors.left: line.left
        anchors.bottomMargin: -2

        Repeater{
            model: 3
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

    //Fuel Numbers
    Row{
        width: progressBar3.width
        height: 30
        anchors.left: progressBar3.left
        anchors.leftMargin: -5
        anchors.bottom: progressBar3.top

        spacing: progressBar3.width/4 - 9
        Repeater{
            model: 4
            Text {
                text: index * 20
                font.pixelSize: 20
                color: "cornsilk"
            }
        }
    }
    //Fuel Text

    Text{
        id: fuelLevelText
        text: "FUEL LEVEL"
        font.pixelSize: 20
        color:"lightcoral"

        anchors.left: progressBar3.left
        anchors.leftMargin: 22
        anchors.top: progressBar3.bottom
    }
}
