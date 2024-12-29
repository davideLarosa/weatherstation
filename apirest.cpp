#include "apirest.h"
#include <QFile>
#include <QDateTime>

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
    QUrl url("https://wttr.in/rome?format=j1&lang=it");

    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    request.setUrl(url);
    m_NetworkAccessManager.get(request);
}

void ApiRest::onRestApiFinished(QNetworkReply *reply) {
    QJsonDocument jsdoc=QJsonDocument::fromJson(reply->readAll());
    setJsonData(jsdoc.object());
    QByteArray docByteArray = jsdoc.toJson(QJsonDocument::Compact);

    QDateTime dateAndTime = QDateTime::currentDateTime();


    qDebug() << QString("Api request run at " + QDateTime::currentDateTime().time().toString() + " on " + QDateTime::currentDateTime().date().toString());
  //  qDebug() << QLatin1String(docByteArray);
}

