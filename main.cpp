#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTimer>
#include "apirest.h"

int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);
    ApiRest apirest;
    QQmlApplicationEngine engine;
    QQmlContext* ctx = engine.rootContext();
    ctx->setContextProperty("appBridge", &apirest);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("WeatherStation", "Main");
    apirest.restApiRequest();

    QTimer timer;
    QObject::connect(&timer, &QTimer::timeout, &apirest, &ApiRest::restApiRequest);
    timer.start(600000);

    return app.exec();
}
