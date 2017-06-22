import QtQuick 2.0

Rectangle {

    property alias stationName: lineText.text

    id: lineInfo
    height:25
    width:200

    color: "white"
    radius: 4
    antialiasing: true



    Text {

        id: lineText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: "StationName"
        color: "black"
        font.bold: true
        font.pixelSize: 12
        wrapMode: Text.Wrap

    }
}
