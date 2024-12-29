#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
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
    QObject::connect(&timer, &QTimer::timeout, &apirest.restApiRequest());
    timer.start(1000);

    return app.exec();
}
