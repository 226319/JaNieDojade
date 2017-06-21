import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtWebView 1.1
import QtPositioning 5.5
import QtLocation 5.6


ApplicationWindow {
    visible: true
    width: 1280
    height: 760
    title: qsTr("APPLab8")

    WebView {
        id: webView
        anchors.fill: parent
        url: MapPage
        onLoadingChanged: {
        }
    }

    Item{
        id: searchOpt;

        Page1 {
        }

    }

    ListModel {
        id: stationlist;

        ListElement { stationName: "Wprowadź nazwę"; stationID: 0 }
        ListElement { stationName: "pl.Bema"; stationID: 4 }
        ListElement { stationName: "pl.Grunwaldzki"; stationID: 5 }
    }


}
