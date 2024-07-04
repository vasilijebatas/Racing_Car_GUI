import QtQuick

Item{
    property int rpmValue: 0
    property int progressBarWidth: progressBarBackground.width
    width: parent.width - 250
    height: 70
    anchors.top: parent.top
    anchors.topMargin: 50
    anchors.right: parent.right
    anchors.rightMargin: 20

    //Progress Bar
    Rectangle{
        id: progressBarBackground
        anchors.fill: parent
         color: "cornsilk"

         Text{
             id: insidetext
             text: Math.round((progressBar.rpmValue / progressBar.progressBarWidth) * 8000)
             anchors.centerIn: parent
             font.pixelSize: 25
             color:"black"
             z: 1
         }

         Rectangle{
            id: progressBarIndicator
            width: rpmValue
            height: parent.height
            color: rpmValue < (7000 * progressBarWidth / 8000) ? "chocolate" : "firebrick"
            anchors.top: parent.top
        }
    }

    Rectangle{
        id: line
        border.color: "chocolate"
        width: progressBar.width
        height: 2
        anchors.bottom: progressBar.top
        anchors.bottomMargin: 2
    }

    //Lines
     Row{
        property int rpmWidth: progressBar.width
        spacing: rpmWidth/8 - 10
        anchors.bottom: line.top
        anchors.left: line.left
        anchors.bottomMargin: -2

        Repeater{
            model: 8
                Rectangle{
                    id: upRightLine
                    border.color: "chocolate"
                    width: 10
                    height: 2
                    transform: Rotation{
                    angle: -90
                    }
             }
        }
    }

    Rectangle{
        id: rightSideUpRightLine
        border.color: "chocolate"
        width: 10
        height: 2
        anchors.bottom: line.top
        anchors.right: line.right
        anchors.rightMargin: -8
        anchors.bottomMargin: -2
        transform: Rotation{
            angle: -90
        }
    }

    //RPM Numbers
    Row{
        anchors.bottom: progressBar.top
        anchors.bottomMargin: 5
        anchors.left: progressBar.left
        anchors.leftMargin: -8
        Repeater{
            model: 9
            Text {
                text: index
                font.pixelSize: 30
                width: progressBar.width / 8
                height: 40
                color: index < 7 ? "cornsilk" : "red"
            }
        }
    }

    //RPM Text
    Text{
        text: "RPM"
        font.pixelSize: 25
        color:"lightcoral"
        anchors.left: progressBar.right
        anchors.leftMargin: -55
        anchors.top: progressBar.bottom
    }
}
