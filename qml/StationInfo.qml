import QtQuick 2.7
import QtQuick.Controls 2.0
import "qrc:/JSFunc/ObjectCreator.js" as ObjectCreator

GroupBox {

    anchors.verticalCenter: parent.verticalCenter
    anchors.left: webView.left
    anchors.leftMargin: 4
    padding: 3
    visible: false

    contentItem: Rectangle {
        id: rectangle2
        anchors.fill: parent
        color: "#0b75c6"
        border.color: Qt.lighter(color)
        opacity: 1


        Column {
            id: stationList
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            padding: 3
            spacing: 2

            ListModel {
                id: sl

                function itemAppend(obj, source) {
                    sl.append({ "obj": obj, "source": source } );
                }

            }
        }
    }

    function addStation(name) {
          ObjectCreator.CreateObject("qrc:/qml/Station.qml",stationList,sl.itemAppend)
          sl.get(sl.count-1).obj.stationName = name;
    } // function

    function clearList() {
        while ( sl.count > 0 ) {
            sl.get(0).obj.destroy();
            sl.remove(0);
        }
    }


  }
