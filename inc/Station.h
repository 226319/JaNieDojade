#ifndef STATION_H
#define STATION_H

#include <QObject>

class Station : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString stationName READ stationName WRITE setStationName NOTIFY stationNameChanged)
public:
    explicit Station(QString stationName, QObject *parent = nullptr){
        m_stationName = stationName;
    }


    QString stationName() const {
        return m_stationName;
    }
    void setStationName(QString stationName) {
        m_stationName = stationName;
    }

signals:

    void stationNameChanged();

public slots:

private:
    QString m_stationName;
};

#endif // STATION_H
