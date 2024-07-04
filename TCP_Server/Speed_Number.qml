import QtQuick

Item {
    property int speedValue: 0
    property alias speedNumberText: speedTextText2.contentWidth
    property string speedUnit: "km/h"
    width: 120
    height: speedNumberText.contentHeight

    Text {
        id: speedNumberText
        font.pixelSize: 90
        color: "cornsilk"
        anchors.centerIn: parent
        text: speedValue.toString()
    }

    //Speed Text
    Text{
        id: speedTextText2
        font.pixelSize: 30
        color: "lightcoral"
        text: speedUnit

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: speedNumberText.bottom
    }
}
