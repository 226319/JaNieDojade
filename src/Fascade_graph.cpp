#include "inc/Fascade_graph.hpp"

QVariantList Fascade_graph::Find(QString origin, QString destination) {

    std::vector<Route> route;

    try {
        route = get_to(origin.toStdString(), destination.toStdString());
    } catch(std::runtime_error& exc)
    {
        std::cerr << exc.what();
    }
    try{
    Export(route);
    } catch( std::runtime_error& exc ) {
        std::cerr << exc.what();
    }


    return toQRouteList(route);

}



QVariantList Fascade_graph::toQRouteList(std::vector<Route> route) {

    Route* pRoute;
    QVariantList vl;

    for( unsigned int Idx = 0; Idx < route.size(); ++Idx ){
        pRoute = &route[Idx];
        QRoute* newRoute = new QRoute;

        newRoute->setDirection( QString::fromStdString(pRoute->getDirection()) );
        newRoute->setVehicleType( QChar::fromLatin1(pRoute->getType()) );
        newRoute->setLine( QString::fromStdString(pRoute->getName()) );
        for (   unsigned int Idy = 0; Idy < pRoute->getStations().size(); ++Idy) {
            newRoute->addStation( std::get<0>( pRoute->getStations()[Idy] ) );
        }

        vl.append( qVariantFromValue( (QObject*)newRoute ) );
    }

    pRoute = nullptr;
    return vl;
}


void Fascade_graph::Export(std::vector<Route>& route) {

    QFile File(QString("js/Waypoints.js"));
    File.open(QIODevice::WriteOnly);
    QTextStream OutStream(&File);

    OutStream << getOriginCoords(route);
    OutStream << getWaypointsCoords(route);
    OutStream << getDestinationCoords(route);


    File.close();


}

QString Fascade_graph::getOriginCoords(std::vector<Route>& route) {

    QString QStr_origin("var start = ");
    QStr_origin.append( getCoords( graph.find_Vertex( std::get<0>(route[0].getStations()[0] )).getCords() ) );
    QStr_origin.append("\n");

    return QStr_origin;
}

QString Fascade_graph::getDestinationCoords(std::vector<Route>& route ) {

    QString QStr_origin("var end = ");
    QStr_origin.append( getCoords( graph.find_Vertex( std::get<0>( route.back().getStations().back() ) ).getCords() ) );
    QStr_origin.append("\n");

    return QStr_origin;
}

QString Fascade_graph::getCoords(const std::pair<double, double> &latlng) {

    QString QStr_origin("{lat:");
    QStr_origin.append(QString::number(std::get<1>(latlng)));
    QStr_origin.append(",lng:");
    QStr_origin.append(QString::number(std::get<0>(latlng)));
    QStr_origin.append("}");

    return QStr_origin;

}

QString Fascade_graph::getWaypointsCoords(std::vector<Route>& route){


    std::vector<std::string> stationList = getStationNameList(route);


    if ( stationList.size() == 2 ) {
         return QString("var waypts = []\n");
    }
    else {
         QString QStr_Waypts("var waypts = [ ");

         for( unsigned int Idx = 1; Idx < stationList.size()-1; ++Idx ) {
                     QStr_Waypts.append("{location:");
                     QStr_Waypts.append( getCoords( graph.find_Vertex( stationList[Idx] ).getCords() ));
                     QStr_Waypts.append(", stopover:true},");
                 }

         QStr_Waypts.append("{location:");
         QStr_Waypts.append(getCoords( graph.find_Vertex( stationList[ stationList.size()-2 ] ).getCords() ) );
         QStr_Waypts.append(", stopover:true}");
         QStr_Waypts.append("]\n");

      return QStr_Waypts;
    }

}

std::vector<std::string> Fascade_graph::getStationNameList(std::vector<Route>& route) {

    std::vector<std::string> stationList;

    for ( unsigned int Idx = 0; Idx < route.size() ; ++Idx ){
        for (unsigned int Idy = 0; Idy < route[Idx].getStations().size(); ++Idy) {
            stationList.push_back( std::get<0>(route[Idx].getStations()[Idy]) );
        }
    }

    return stationList;


}
