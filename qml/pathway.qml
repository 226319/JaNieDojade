import QtQuick 2.0

Item {

    property alias stationName: stationName.text

    width: 110
    height: 110
    anchors.verticalCenter: parent.verticalCenter

    Image {
        width: 40
        height: 40
        anchors.bottomMargin: 4
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/svg/arrow.svg"

    }

    Item {

        id: directionInfo
        height:17
        width:100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {

            anchors.fill: parent
            color: "white"
            radius: 4

        }

        Text {

            id: stationName
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "StationName"
            color: "black"
            font.bold: true
            font.pixelSize: 9

        }
    }


}
