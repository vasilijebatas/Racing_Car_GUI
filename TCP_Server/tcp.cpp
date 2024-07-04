#include "tcp.h"
#include <QTcpServer>
#include <QTcpSocket>

tcp::tcp(QObject *parent)
    : QObject{parent}, m_tcpServer(new QTcpServer(this)), m_serverIsUp(false)
{
}

//public slots:

bool tcp::isServerUp() const
{
    return m_serverIsUp;
}

void tcp::startServer() {
    if (!m_tcpServer->listen(QHostAddress::Any, 1234)) {
        qDebug() << "Error: " << m_tcpServer->errorString();
        return;
    }

    m_serverIsUp = true;
    emit serverStatusChanged(true);

    connect(m_tcpServer, &QTcpServer::newConnection, this, &tcp::handleNewConnection);
    qDebug() << "Server started.";
}

void tcp::stopServer() {
    m_tcpServer->close();
    m_serverIsUp = false;
    emit serverStatusChanged(false);
    qDebug() << "Server stopped.";
}

void tcp::handleNewConnection() {
    QTcpSocket *clientSocket = m_tcpServer->nextPendingConnection();
    connect(clientSocket, &QTcpSocket::readyRead, this, &tcp::handleReadyRead);
    auto ok = clientSocket->open(QIODeviceBase::ReadOnly);
    if (ok) {
        qDebug() << "IS OK!";
    }
    emit newConnection(clientSocket);
}

void tcp::handleReadyRead() {
    QTcpSocket *clientSocket = qobject_cast<QTcpSocket*>(sender());
    if (!clientSocket)
        return;

    QDataStream in(clientSocket);

    int speed, rpm, waterTemp, fuelLevel, oilTemp, oilPressure, gear;
    in >> speed >> rpm >> waterTemp >> fuelLevel >> oilTemp >> oilPressure >> gear;

    emit dataReceived(speed, rpm, waterTemp, fuelLevel, oilTemp, oilPressure, gear);
}
