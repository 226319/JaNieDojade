import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtWebView 1.1
import QtPositioning 5.5
import App 1.0
import "qrc:/JSFunc/functions.js" as Funct
import "qrc:/JSFunc/ObjectCreator.js" as ObjectCreator



ApplicationWindow {
    id: mainApp
    visible: true
    width: 1400
    height: 900
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

                var itm = route.Find(startPoint.currentText, endPoint.currentText);

                if (!itm) {
                    warnWindow.warn(route.exception);
                }

                Funct.prepareDisplayInfo(itm, routeInfo);
               // Funct.prepareDisplay(itm, routeDisplay);

                webView.reload();

            } else
                warnWindow.warn("Przystanek końcowy i początkowy nie może być taki sam.");
        }
    }


   RouteDisplay {
       id:routeInfo

    }

/*
    Rectangle {

        id: routeDisplay

        color: "#0b75c6"
        width: 1120;
        height: 140;
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter

        ListModel {
            id:routeStops

            function itemAppend(obj, source) {
                routeStops.append({ "obj": obj, "source": source } )
            }
        }

        SwipeView {
            id: routeInfo
            anchors.fill: parent

        }

        function addVehicle(line,direction,list) {

            ObjectCreator.CreateObject("qrc:/qml/VehicleLineInfo.qml", routeInfo, routeStops.itemAppend);
            var itm = routeStops.get(routeStops.count-1).obj;
            itm.lineText = line;
            itm.directionText = direction
            itm.stationList = list;
        }

        function addTram(line, direction,list) {
            routeDisplay.addVehicle(line,direction,list)
            routeStops.get(routeStops.count-1).obj.vehicleImage = "qrc:/svg/tram.svg";

        }

        function addBus(line, direction,list) {
            routeDisplay.addVehicle(line,direction,list)
            routeStops.get(routeStops.count-1).obj.vehicleImage = "qrc:/svg/bus.svg";

        }

        function addPathway(name) {
            ObjectCreator.CreateObject("qrc:/qml/pathway.qml",routeInfo,routeStops.itemAppend)
            routeStops.get(routeStops.count-1).obj.stationName = name;

        }

    }
    */

   ExceptionWindow {
       id: warnWindow
       objectName: "warnWindow"
       x: (mainApp.width - width)/2
       y: (mainApp.height - height)/2
   }

    StationInfo { id:stationInfo }






}


