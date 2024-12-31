#include "apirest.h"
#include <QFile>
#include <QDateTime>
#include <QTextStream>

ApiRest::ApiRest(QObject *parent)
    : QObject{parent}
{
    QObject::connect(&m_NetworkAccessManager, SIGNAL(finished(QNetworkReply*)), this, SLOT(onRestApiFinished(QNetworkReply*)));
}

QJsonObject ApiRest::JsonData() const {
    return m_JsonData;
}

void ApiRest::setJsonData(const QJsonObject& data) {
    m_JsonData = data;
    emit dataChanged(m_JsonData);
}

void ApiRest::restApiRequest() {
    QNetworkRequest request;
    QUrl url("https://wttr.in/Rome?format=j1&lang=it");

    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    request.setUrl(url);
    m_NetworkAccessManager.get(request);
}

void ApiRest::onRestApiFinished(QNetworkReply *reply) {
    QString logString = "App is running";

    QString filename = "/tmp/weatherStation.log";
    QFile file(filename);
    if (file.open(QIODevice::Append | QIODevice::Text)) {
        QTextStream stream(&file);
        stream << logString << Qt::endl;
        file.close();
    } else {
        qDebug() << "Cannot open destination log fine";
    }

    QVariant statusCode = reply->attribute( QNetworkRequest::HttpStatusCodeAttribute );
    int status = statusCode.toInt();
    logString = "Curl response code " + reply->attribute( QNetworkRequest::HttpReasonPhraseAttribute ).toString();
    if (file.open(QIODevice::Append | QIODevice::Text)) {
        QTextStream stream(&file);
        stream << logString << Qt::endl;
        file.close();
    } else {
        qDebug() << "Cannot open destination log fine";
    }
    qDebug() << logString;

    QJsonDocument jsdoc=QJsonDocument::fromJson(reply->readAll());
    setJsonData(jsdoc.object());
    QByteArray docByteArray = jsdoc.toJson(QJsonDocument::Compact);

    QDateTime dateAndTime = QDateTime::currentDateTime();

    logString = "Api request run at " + QDateTime::currentDateTime().time().toString() + " on " + QDateTime::currentDateTime().date().toString();
    if (file.open(QIODevice::Append | QIODevice::Text)) {
        QTextStream stream(&file);
        stream << logString << Qt::endl;
        file.close();
    } else {
        qDebug() << "Cannot open destination log fine";
    }

    logString = "Request output is: \n" + QString(docByteArray);
    if (file.open(QIODevice::Append | QIODevice::Text)) {
        QTextStream stream(&file);
        stream << logString << Qt::endl;
        file.close();
    } else {
        qDebug() << "Cannot open destination log fine";
    }
    qDebug() << logString;

}

