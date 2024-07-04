#include "tcp_client.h"
#include <QTcpSocket>

tcp_client::tcp_client(QObject *parent) : QObject(parent)
{
    connect(&socket, &QTcpSocket::connected, this, &tcp_client::onConnected);
    connect(&socket, &QTcpSocket::errorOccurred, this, &tcp_client::onErrorOccured);
}

void tcp_client::newMessage(int speed, int rpm, int waterTemp, int fuelLevel, int oilTemp, int oilPressure, int gear)
{
    dataStruct message;
    message.speed = speed;
    message.rpm = rpm;
    message.waterTemp = waterTemp;
    message.fuelLevel = fuelLevel;
    message.oilTemp = oilTemp;
    message.oilPressure = oilPressure;
    message.gear = gear;

    QByteArray block;
    QDataStream out(&block, QIODevice::WriteOnly);

    out << speed << rpm << waterTemp << fuelLevel << oilTemp << oilPressure << gear;

    socket.write(block);
}

void tcp_client::connectToServer(const QString &ip, const QString &port)
{
    socket.connectToHost(ip, port.toUInt());
}

void tcp_client::onConnected()
{
    qInfo() << "Connected to the server (host).";
}

void tcp_client::onErrorOccured(QAbstractSocket::SocketError error)
{
    qWarning() << "Error:" << error;
}


