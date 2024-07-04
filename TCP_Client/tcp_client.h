#ifndef TCP_CLIENT_H
#define TCP_CLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QAbstractSocket>

struct dataStruct{
    int speed, rpm, waterTemp, fuelLevel, oilTemp, oilPressure, gear;
};

class tcp_client: public QObject
{
    Q_OBJECT
public:
    explicit tcp_client(QObject *parent = nullptr);
    Q_INVOKABLE void newMessage(int speed, int rpm, int waterTemp, int fuelLevel, int oilTemp, int oilPressure, int gear);

signals:

public slots:
    void connectToServer(const QString &ip, const QString &port);

private slots:
    void onConnected();
    void onErrorOccured(QAbstractSocket::SocketError error);

private:
    QTcpSocket socket;
};

#endif // TCP_CLIENT_H
