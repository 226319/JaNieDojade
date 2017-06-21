import QtQuick 2.0

Item {

    id: button

    property alias lineText: lineText.text
    property alias directionText: directionText.text
    property alias vehicleImage: vehicleImage.source
    property color hoverColor: Qt.lighter("#0b75c6")
    property color pressColor: Qt.darker("#0b75c6")
    property var stationList
    property var clickFlag

    width:  110
    height: 110
    anchors.verticalCenter: parent.verticalCenter

    signal clicked

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#0b75c6"
    }

    Rectangle {

        id: lineInfo
        height:20
        width:60
        anchors.top: parent.top
        anchors.topMargin: 4
        anchors.horizontalCenter: parent.horizontalCenter

        color: "white"
        radius: 4



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
        id: vehicleImage
        width: 55
        height: 55
        anchors.top: lineInfo.bottom
        anchors.topMargin: 4
        anchors.horizontalCenter: parent.horizontalCenter
        source: ""

    }


        Rectangle {
            id: directionInfo
            height:17
            width:100
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 4
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            radius: 4



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

    states: [
          State {
              name: "Hovering"
              PropertyChanges {
                  target: background
                  color: hoverColor
              }
          },
          State {
              name: "Pressed"
              PropertyChanges {
                  target: background
                  color: pressColor
              }
          }
      ]

      transitions: [
          Transition {
              from: ""; to: "Hovering"
              ColorAnimation { duration: 200 }
          },
          Transition {
              from: "*"; to: "Pressed"
              ColorAnimation { duration: 10 }
          }
      ]

        MouseArea {
               hoverEnabled: true
               anchors.fill: button
               onEntered: { button.state='Hovering'}
               onExited: { button.state=''}
               onClicked: { button.clicked();}
               onPressed: { button.state="Pressed" }
               onReleased: {
                   if (containsMouse)
                     button.state="Hovering";
                   else
                     button.state="";
               }
        }

        onClicked:{
            if ( clickFlag != 0 ) {
                stationInfo.visible = true;
                stationInfo.clearList();

                for ( var idx = 0; idx < stationList.length; ++idx) {
                    stationInfo.addStation(stationList[idx]);
                }
                clickFlag = 0;
            } else {
                stationInfo.visible = false;
                clickFlag = 4;
            }

        }

}
