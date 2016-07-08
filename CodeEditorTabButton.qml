import QtQuick 2.7
import QtQuick.Controls 2.0

TabButton {
    id: root
    property CodeEditor codeEditor
    height: parent ? parent.height : 0
    onCodeEditorChanged: {
        if(codeEditor === undefined || codeEditor === null) return
        if(codeEditor != undefined) {
            text = codeEditor.title
        }

        codeEditor.titleChanged.connect(function() {
            if(codeEditor != undefined) {
                text = codeEditor.title
                console.log("Background: ", background.color)
            }
        })
    }

    background: Rectangle {
        width: parent.width
        height: parent.height
        opacity: enabled ? 1 : 0.3
        color: root.focus ? "#fff" : "#aaa"
    }

    implicitWidth: width
    width: parent ? parent.width / parent.count : 0
}
