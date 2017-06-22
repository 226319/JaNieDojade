#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickItem>
#include <QQmlContext>
#include <QDir>
#include <QtWebView/QtWebView>
#include <iostream>
#include <fstream>
#include <sstream>
#include <ctime>
#include <iomanip>
#include "inc/Includes.hpp"
#include "inc/Vertex.hpp"
#include "inc/Route.hpp"
#include "inc/Fascade_graph.hpp"
#include "inc/Station.h"



void addStationsToList(QList<QObject*>& list, std::map<std::string,std::string> stationMap){
    std::map<std::string,std::string>::iterator iter;

    for ( iter = stationMap.begin(); iter != stationMap.end(); ++iter ) {
        list.append( new Station( QString::fromStdString(iter->second) ) );
    }

}

using namespace std;

int main(int argc, char *argv[])
{
    ifstream vertexfile("Datafiles/GTFS/stops.txt", ifstream::in);
    ifstream timefile("Datafiles/GTFS/stop_times.txt", ifstream::in);
    ifstream routefile("Datafiles/GTFS/trips.txt", ifstream::in);

    map<string, string> stations; //id, name of vertex
    map<string, Vertex> vertexes; //name, vertex
    map<string, Route> routes; // id, route

    string line;
    getline(vertexfile, line);
    //getline(timefile, line);
    //getline(routefile, line);

    while (getline(vertexfile, line)){
      std::istringstream ss(line);
      string var;
      string ID;
      string name;
      double lat;
      double lon;

      getline(ss, var, ',');
      ID = var;
      getline(ss, var, ',');
      getline(ss, var, ',');
      name = var;
      getline(ss, var, ',');
      lat = atof(var.c_str());
      getline(ss, var, ',');
      lon = atof(var.c_str());

      Vertex tmp(ID, name, lon, lat);

      stations[ID] = name;
      vertexes[name] = tmp;
    }

    while (getline(routefile, line)){
      std::istringstream ss(line);
      string var;
      string name;
      string ID;
      string dir;
      char type;

      getline(ss, var, ',');
      name = var;
      getline(ss, var, ',');
      getline(ss, var, ',');
      ID = var;
      getline(ss, var, ',');
      dir = var;
      getline(ss, var, ',');
      getline(ss, var, ',');
      getline(ss, var, ',');
      if (var == "12" || var == "28" || var == "34" || var == "36"){
        type = TRAM;
      } else{
        type = BUS;
      }
      getline(ss, var, ',');

      Route tmp(name, dir, type, var);
      routes.insert(pair<string, Route>(ID, tmp));
    }
    string previous_route_id = "";
    string previous_stop_id = "";
    time_t base_time { };
    time_t previous_time { };

    while (getline(timefile, line)){
      std::istringstream ss(line);
      struct std::tm tm;
      string var;
      string route_id;
      string stop_id;
      string dir;

      getline(ss, var, ',');
      route_id = var;
      getline(ss, var, ',');
      getline(ss, var, ',');
      std::istringstream sss(var);
      sss >> std::get_time(&tm, "%H:%M:%S");
      std::time_t time = mktime(&tm);
      getline(ss, var, ',');
      stop_id = var;

      if (previous_route_id != route_id){
        base_time = time;
        previous_time = time;
        previous_route_id = "";
      }

      if (previous_route_id != ""){
        vertexes.at(stations.at(previous_stop_id)).addNeighbour(
            stations.at(stop_id), (int) difftime(time, previous_time) / 60);
      }

      routes.at(route_id).addStop(stations[stop_id],
          (int) difftime(time, base_time) / 60);

      previous_route_id = route_id;
      previous_time = time;
      previous_stop_id = stop_id;
    }

    Fascade_graph graph;
    vector<Route> vec;
    graph.add_stations(std::move(vertexes));
    for (auto&i : routes){
      vec.push_back(i.second);
    }
    graph.add_routes(std::move(vec));


    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QtWebView::initialize();

    QString MapLocation = QDir::currentPath();
    MapLocation.append(QString("/html/Map.html"));
    QQmlApplicationEngine engine;
    //Fascade_graph graph;

    qmlRegisterType<QRoute>("App",1,0,"QRoute");
    qmlRegisterType<QRoute>("App",1,0,"Station");

    QList<QObject*> stationList;
    addStationsToList(stationList,stations);


    QQmlContext *context = engine.rootContext();
    context->setContextProperty("MapPage", QUrl::fromLocalFile(MapLocation));
    context->setContextProperty("route", &graph);
    context->setContextProperty("stationList",QVariant::fromValue(stationList));
    engine.load(QUrl(QLatin1String("qrc:/qml/main.qml")));



    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
