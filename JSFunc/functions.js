function prepareDisplayInfo(itm,routeInfo) {

        routeInfo.clearList();

    for ( var idx = 0; idx < itm.length ; ++idx) {

        if (idx > 0 ){
            routeInfo.addPathway(itm[idx-1].stationList[ itm[idx-1].stationList.length -1 ] );
        }

        if ( itm[idx].vehicleType === 'T' ) {
            routeInfo.addTram(itm[idx].line, itm[idx].direction, itm[idx].stationList);
        } else {
            routeInfo.addBus(itm[idx].line, itm[idx].direction,itm[idx].stationList);
        }
    }

    routeInfo.visible = true;

}
