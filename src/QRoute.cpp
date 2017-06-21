#include "inc/QRoute.h"

QRoute::QRoute(QObject *parent) : QObject(parent)
{

}

QString QRoute::direction() const {
    return m_direction;
}

QChar QRoute::vehicleType() const {
    return m_vehicleType;
}

QVariantList QRoute::stationList() const {
    return m_stationList;
}

void QRoute::setDirection(QString direction){
    m_direction = direction;
}

void QRoute::setVehicleType(QChar vehicleType){
    m_vehicleType = vehicleType;
}

void QRoute::setStationList(QVariantList stationList){
    m_stationList=stationList;
}

void QRoute::addStation(std::string string){
    m_stationList.append(QString::fromStdString(string));
}

