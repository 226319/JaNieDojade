import QtQuick 2.0
import QtQuick.Controls 2.0
import "qrc:/JSFunc/ObjectCreator.js" as ObjectCreator


GroupBox {

    property alias count: routeStops.count


        id: routeInfo
        anchors.bottom: webView.bottom
        anchors.bottomMargin: 4
        anchors.horizontalCenter: webView.horizontalCenter

        visible: false
        padding: 0

        contentItem:
            Rectangle {
                id: rectangle1
                anchors.fill: parent
                color: "#0b75c6"
                border.color: Qt.lighter(color)
                opacity: 1


            Row {
                id: routeDisplay
                anchors.verticalCenter: parent.verticalCenter
                spacing: 0

                ListModel {

                    id: routeStops

                    function itemAppend(obj, source) {
                        routeStops.append({ "obj": obj, "source": source } )
                    }

                }

                function addVehicle(line,direction,list) {

                    ObjectCreator.CreateObject("qrc:/qml/VehicleLineInfo.qml", routeDisplay, routeStops.itemAppend);
                    var itm = routeStops.get(routeStops.count-1).obj;
                    itm.lineText = line;
                    itm.directionText = direction
                    itm.stationList = list;
                }

            }

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
            ObjectCreator.CreateObject("qrc:/qml/pathway.qml",routeDisplay,routeStops.itemAppend)
            routeStops.get(routeStops.count-1).obj.stationName = name;

        }

        function clearList() {
            while ( routeStops.count > 0 ) {
                routeStops.get(0).obj.destroy();
                routeStops.remove(0);
            }
            routeInfo.visible = false;
        }

}
