import QtQuick

Item {
    property int gearValue: 0
    width: gearNumberText.contentWidth
    height: gearNumberText.contentHeight

    Text {
        id: gearNumberText
        font.pixelSize: 200
        color: "cornsilk"
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop

        function toggleText(){
            if(gearValue === 0){
                return "R"
            } else if(gearValue === 1){
                return "N"
            } else {
                return gearValue.toString() - 1
            }
        }

        text:{
            toggleText()
        }
    }

    //Gear Text
    Text {
        id: gearTextText
        font.pixelSize: 50
        color: "lightcoral"
        text: "GEAR"

        anchors.horizontalCenter: gearNumberText.horizontalCenter
        anchors.top: gearNumberText.bottom
    }
}
