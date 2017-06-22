import QtQuick 2.0

Item {

    property alias stationName: stationName.text

    width: 145
    height: 145
    anchors.verticalCenter: parent.verticalCenter

    Image {
        width: 55
        height: 55
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/svg/arrow.svg"

    }

    Item {

        id: directionInfo
        height:20
        width:135
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
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
            font.pixelSize: 7

        }
    }


}
