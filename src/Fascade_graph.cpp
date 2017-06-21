#include "inc/Fascade_graph.hpp"

QVariantList Fascade_graph::Find(QString origin, QString destination) {
/*
    std::vector<Route> route;

    try {
        route = get_to(origin.toStdString(), destination.toStdString());
    } catch(std::runtime_error& exc)
    {
      QMessageBox messageBox;
      messageBox.critical(0,QString::fromLatin1("Error"),QString::fromLatin1(exc.what()));
      messageBox.setFixedSize(500,200);
    }



    return toQRouteList(route);
*/
    std::vector<Route> route;

 for ( unsigned int Idx = 0 ; Idx < 3; ++Idx) {
    Route newRoute(std::to_string(Idx+1), std::string("Pl.Grunwaldzki"), 'T', Idx);

    for(unsigned int Idy = 0 ; Idy < 10; ++Idy ){
        newRoute.addStop( std::string("Station") + std::to_string(Idx*Idy), Idx );
    }
    route.push_back(newRoute);
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
