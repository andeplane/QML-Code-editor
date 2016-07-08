import QtQuick 2.7
import QtQuick.Controls 2.0

TabButton {
    id: root
    property CodeEditor codeEditor
    height: parent.height
    onCodeEditorChanged: {

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
        color: root.focus ? "#fff" : "#ccc"
    }

//    Timer {
//        interval: 1000
//        repeat: true
//        running: true
//        onTriggered: {
//            console.log("Background: ", background)
//            console.log("Background color: ", background.color)
//        }
//    }

//    implicitWidth: contentItem.implicitWidth + leftPadding + rightPadding // This fixes that text is "myfil..." when changed
//    width: implicitWidth
    width: parent.width / parent.count
}
