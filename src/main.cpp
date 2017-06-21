#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickItem>
#include <QQmlContext>
#include <QDir>
#include <QtWebView/QtWebView>
#include "inc/Fascade_graph.hpp"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QtWebView::initialize();

    QString MapLocation = QDir::currentPath();
    MapLocation.append(QString("/html/Map.html"));
    QQmlApplicationEngine engine;
    Fascade_graph graph;

    qmlRegisterType<QRoute>("test",1,0,"QRoute");



    QQmlContext *context = engine.rootContext();
    context->setContextProperty("MapPage", QUrl::fromLocalFile(MapLocation));
    //context->setContextProperty("routeReq", &routeReq);
    context->setContextProperty("route", &graph);
    engine.load(QUrl(QLatin1String("qrc:/qml/main.qml")));



    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
