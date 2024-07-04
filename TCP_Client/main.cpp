#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QHostAddress>
#include <QNetworkInterface>
#include <QAbstractSocket>
#include <QFuture>
#include "tcp_client.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType <tcp_client> ("Version", 1, 0, "Tcp_Client");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/Tcp_Client/main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
