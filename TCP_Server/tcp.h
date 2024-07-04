#ifndef TCP_H
#define TCP_H

#include <QObject>
#include <QTcpSocket>
#include <QAbstractSocket>
#include <QThread>
#include <QObject>
#include <QtNetwork>
#include <QTcpSocket>
#include <QDebug>
#include <QObject>
#include <QTcpServer>


class tcp : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool server_is_up READ isServerUp NOTIFY serverStatusChanged)

public:
    explicit tcp(QObject *parent = nullptr);

    bool isServerUp() const;

signals:
    void newConnection(QTcpSocket *socket);
    void dataReceived(int speed, int rpm, int waterTemp, int fuelLevel, int oilTemp, int oilPressure, int gear);

    void serverStatusChanged(bool serverIsUp);

private slots:
    void handleNewConnection();
    void handleReadyRead();

public slots:
    void startServer();
    void stopServer();

private:
    QTcpServer *m_tcpServer;
    bool m_serverIsUp;
};

#endif // TCP_H
