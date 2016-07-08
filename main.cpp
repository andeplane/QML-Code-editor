#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "linenumbers.h"
#include "codeeditorbackend.h"
int main(int argc, char *argv[])
{
    qmlRegisterType<LineNumbers>("CodeEditor", 1, 0, "LineNumbers");
    qmlRegisterType<CodeEditorBackend>("CodeEditor", 1, 0, "CodeEditorBackend");
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
