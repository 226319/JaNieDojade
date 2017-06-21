#ifndef QROUTE_H
#define QROUTE_H

#include <QObject>
#include <QString>
#include <QList>

class QRoute : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString direction READ direction WRITE setDirection NOTIFY directionChanged)
    Q_PROPERTY(QChar vehicleType READ vehicleType WRITE setVehicleType NOTIFY vehicleTypeChanged)
    Q_PROPERTY(QVariantList stationList READ stationList WRITE setStationList NOTIFY stationListChanged)
    Q_PROPERTY(QString line READ line WRITE setLine NOTIFY lineChanged)
public:
    explicit QRoute(QObject *parent = nullptr);

    QString direction() const;
    QChar vehicleType() const;
    QVariantList stationList() const;
    QString line() const {
        return m_line;
    }

    void setDirection(QString direction);
    void setVehicleType(QChar vehicleType);
    void setStationList(QVariantList stationList);
    void addStation( std::string );
    void setLine(QString line){
        m_line = line;
    }



signals:
    void directionChanged();
    void vehicleTypeChanged();
    void stationListChanged();
    void lineChanged();

public slots:

private:
    QString m_direction;
    QChar m_vehicleType;
    QVariantList m_stationList;
    QString m_line;
};

#endif // QROUTE_H
