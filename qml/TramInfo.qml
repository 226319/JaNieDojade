import QtQuick 2.0

Item {

    property alias lineText: lineText.text
    property alias directionText: directionText.text


    width:  110
    height: 110
    anchors.verticalCenter: parent.verticalCenter


    Rectangle {
        anchors.fill: parent
        color: "#0b75c6"// Qt.lighter("#0b75c6")
    }

    Item {

        id: lineInfo

        height:20
        width:60
        anchors.top: parent.top
        anchors.topMargin: 4
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {

            anchors.fill: parent
            color: "white"
            radius: 4

        }

        Text {

            id: lineText
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "StationName"
            color: "black"
            font.bold: true
            font.pixelSize: 15

        }
    }

    Image {
        width: 52
        height: 52
        anchors.top: lineInfo.bottom
        anchors.topMargin: 4
        anchors.horizontalCenter: parent.horizontalCenter
        source: "tram.svg"

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

            id: directionText
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "StationName"
            color: "black"
            font.bold: true
            font.pixelSize: 9

        }
    }




}
