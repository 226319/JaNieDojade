function prepareDisplayInfo(itm,routeInfo) {

    if (routeInfo.count > 0) {
        routeInfo.clearList();
    }

    for ( var idx = 0; idx < itm.length ; ++idx) {

        if (idx > 0 ){
            routeInfo.addPathway(itm[idx].stationList[0]);
        }

        if ( itm[idx].vehicleType === 'T' ) {
            routeInfo.addTram(itm[idx].line, itm[idx].direction, itm[idx].stationList);
        } else {
            routeInfo.addBus(itm[idx].line, itm[idx].direction,itm[idx].stationList);
        }
    }

    routeInfo.visible = true;

}
