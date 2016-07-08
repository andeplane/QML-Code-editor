import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    property int editorCount: 1

    header: Row {
        TabBar {
            id: tabBar
            currentIndex: stackLayout.currentIndex
            width: parent.width - newTabButton.width
            onCurrentIndexChanged: {
                console.log("Changed tab bar index: ", currentIndex)
            }

            CodeEditorTabButton {
                text: codeEditor_1.title
                codeEditor: codeEditor_1
            }
        }
        Button {
            id: newTabButton
            text: "New"
            onClicked: {
                editorCount = editorCount+1
                var newCodeEditor = Qt.createQmlObject("import QtQuick 2.7; CodeEditor { }", stackLayout);
                var newTabButton = Qt.createQmlObject("import QtQuick 2.7; import QtQuick.Controls 2.0; CodeEditorTabButton { }", tabBar);
                tabBar.setCurrentIndex(tabBar.count-1)
                newTabButton.codeEditor = newCodeEditor
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
            id: codeEditor_1
        }

    }

    Shortcut {
        sequence: StandardKey.Save
        onActivated: {
            var currentEditor = stackLayout.itemAt(stackLayout.currentIndex)
            currentEditor.save()
        }
    }

    Shortcut {
        sequence: StandardKey.SaveAs
        onActivated: {
            var currentEditor = stackLayout.itemAt(stackLayout.currentIndex)
            currentEditor.saveAs()
        }
    }
    Item {
        id: shortcuts
        Shortcut {
            sequence: "Ctrl+1"
            onActivated: {

                if(editorCount >= 1) tabBar.setCurrentIndex(0)
            }
        }
        Shortcut {
            sequence: "Ctrl+2"
            onActivated: {
                if(editorCount >= 2) tabBar.setCurrentIndex(1)
            }
        }
        Shortcut {
            sequence: "Ctrl+3"
            onActivated: {
                if(editorCount >= 3) tabBar.setCurrentIndex(2)
            }
        }
        Shortcut {
            sequence: "Ctrl+4"
            onActivated: {
                if(editorCount >= 4) tabBar.setCurrentIndex(3)
            }
        }
        Shortcut {
            sequence: "Ctrl+5"
            onActivated: {
                if(editorCount >= 5) tabBar.setCurrentIndex(4)
            }
        }
        Shortcut {
            sequence: "Ctrl+6"
            onActivated: {
                if(editorCount >= 6) tabBar.setCurrentIndex(5)
            }
        }
        Shortcut {
            sequence: "Ctrl+7"
            onActivated: {
                if(editorCount >= 7) tabBar.setCurrentIndex(6)
            }
        }
        Shortcut {
            sequence: "Ctrl+8"
            onActivated: {
                if(editorCount >= 8) tabBar.setCurrentIndex(7)
            }
        }
        Shortcut {
            sequence: "Ctrl+9"
            onActivated: {
                if(editorCount >= 9) tabBar.setCurrentIndex(8)
            }
        }
        Shortcut {
            sequence: "Ctrl+0"
            onActivated: {
                if(editorCount >= 10) tabBar.setCurrentIndex(9)
            }
        }
    }
}
