import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtWebView 1.1
import QtPositioning 5.5
import test 1.0
import "qrc:/JSFunc/functions.js" as Funct



ApplicationWindow {
    id: mainApp
    visible: true
    width: 1280
    height: 760
    title: qsTr("APPLab8")

    WebView {
        id: webView
        anchors.fill: parent
        url: MapPage
        onLoadingChanged: {
            if (loadRequest.errorString)
                console.error(loadRequest.errorString);
        }
    }

    SearchPanel {
        id: searchPanel

        searchButton.onClicked:   {

            if ( startPoint.currentIndex != endPoint.currentIndex ) {

                var itm = route.Find(startPoint.currentText, startPoint.currentText);

                if (!itm) {
                    warnWindow.warn(route.exception);
                }

                Funct.prepareDisplayInfo(itm, routeInfo);
                webView.reload();

            } else
                warnWindow.warn("Przystanek końcowy i początkowy nie może być taki sam.");
        }
    }


    RouteDisplay { id:routeInfo
        x: (mainApp.width - width)/2
        y: (mainApp.height - height)/2
    }


    ListModel {
        id: stationlist;

        ListElement { stationName: "pl.Bema"; stationID: 4 }
        ListElement { stationName: "pl.Grunwaldzki"; stationID: 5 }
    }



   ExceptionWindow {
       id: warnWindow
       objectName: "warnWindow"
       x: (mainApp.width - width)/2
       y: (mainApp.height - height)/2
   }

    StationInfo { id:stationInfo }



}


