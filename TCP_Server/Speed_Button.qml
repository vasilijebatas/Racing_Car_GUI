import QtQuick
import QtQuick.Controls

Button{
    id: speedButton
    text: "SETTINGS"

    property bool kmhmph: true

    function toggleSpeed(){
        speedButton.kmhmph = !speedButton.kmhmph;

            if (speedButton.kmhmph) {
                speednumber.speedUnit = "mph";
                speednumber.speedValue = Math.round(speednumber.speedValue / 1.60934);
            } else {
                speednumber.speedUnit = "km/h";
                speednumber.speedValue *= 1.60934;
            }
    }
    onClicked: toggleSpeed()
}

