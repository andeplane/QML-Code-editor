import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    header: Row {
        TabBar {
            id: tabBar
            currentIndex: stackLayout.currentIndex
            onCurrentIndexChanged: {
                console.log("Changed tab bar index: ", currentIndex)
            }

            TabButton {
                text: qsTr("Tab 1 balle balle")
            }
            TabButton {
                text: qsTr("Tab 2")
            }
        }
        Button {
            text: "Add"
            onClicked: {
                var newObject = Qt.createQmlObject('import QtQuick 2.7; CodeEditor { }',
                                                   stackLayout,
                                                   "balle");
                var newObject2 = Qt.createQmlObject('import QtQuick 2.7; import QtQuick.Controls 2.0; TabButton { text: qsTr("Tab '+(tabBar.count+1)+'") }',
                                                   tabBar,
                                                   "balle2");
            }
        }
    }

    StackLayout {
        id: stackLayout
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        onCurrentIndexChanged: {
            console.log("Changed stack layout index: ", currentIndex)
        }
        CodeEditor {
            text: "hei1"
        }

        CodeEditor {
            text: "hei2"
        }
    }
}
