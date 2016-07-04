#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "linenumbers.h"

int main(int argc, char *argv[])
{
    qmlRegisterType<LineNumbers>("LineNumbers", 1, 0, "LineNumbers");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
