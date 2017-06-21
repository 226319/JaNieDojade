import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

GroupBox {

    property alias searchButton: searchButton
    property alias startPoint: startPoint
    property alias endPoint: endPoint

           id: searchOpt
           anchors.margins:5
           anchors.top: webView.top
           anchors.horizontalCenter: webView.horizontalCenter

           width: 852
           height: 114
           font.pointSize: 12
           padding: 3
           title: qsTr("")

           Rectangle {
               id: rectangle
               anchors.fill: parent
               color: "#0b75c6"
               border.color: Qt.lighter(color)
               opacity: 1
           }

           ComboBox {
               id: startPoint
               x: 48
               y: 40
               width: 210
               height: 40
               textRole: "stationName"
               editable: true
               focus: true
               model: stationlist
               currentIndex: -1
               onAccepted: {
                   endPoint.focus = true
               }

               Label {
                   id: start
                   x: -11
                   y: -26
                   width: 114
                   height: 14
                   text: qsTr("Przystanek początkowy:")
               }
           }

           ComboBox {
               id: endPoint
               x: 356
               y: 40
               width: 211
               height: 40
               textRole: "stationName"
               editable: true
               model: stationlist
               currentIndex: -1
               onAccepted: {
                   searchButton.clicked();
               }

               Label {
                   id: end
                   x: -11
                   y: -27
                   width: 43
                   height: 14
                   text: qsTr("Przystanek końcowy:")
               }
           }

           Button {
               id: searchButton
               x: 655
               y: 40
               width: 133
               height: 40
               text: qsTr("Szukaj")

           }
}
