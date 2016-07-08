import QtQuick 2.7
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2
import CodeEditor 1.0

Item {
    id: root
    property alias text: textArea.text
    property string title: changedSinceLastSave ? fileName+"*" : fileName
    property alias fileName: backend.fileName
    property bool changedSinceLastSave: false
    function save() {
        backend.text = textArea.text
        if(fileName === "untitled") {
            fileDialogSave.cb = function() {
                save()
                fileDialogSave.cb = undefined
            }
            fileDialogSave.visible = true
        } else {
            if(backend.save()) {
                changedSinceLastSave = false
            }
        }
    }

    function saveAs() {
        backend.text = textArea.text
        fileDialogSave.cb = function() {
            save()
            fileDialogSave.cb = undefined
        }
        fileDialogSave.visible = true
    }

    LineNumbers {
        id: lineNumbers
        height: parent.height
        width: 40
    }

    CodeEditorBackend {
        id: backend
        fileName: "untitled"
    }

    TextArea {
        id: textArea
        height: parent.height
        width: parent.width-lineNumbers.width
        anchors.left: lineNumbers.right

        function update() {
            var lineHeight = 16;//(contentHeight-8) / lineCount
            lineNumbers.lineCount = lineCount
            lineNumbers.scrollY = flickableItem.contentY
            lineNumbers.lineHeight = lineHeight
            lineNumbers.cursorPosition = cursorPosition
            lineNumbers.selectionStart = selectionStart
            lineNumbers.selectionEnd = selectionEnd
            lineNumbers.text = text
            lineNumbers.update()
        }

        Component.onCompleted: {
            flickableItem.contentYChanged.connect(update)
            update()
        }

        onTextChanged: {
            console.log("Changed text...title: ", root.title)
            changedSinceLastSave = true
        }

        onLineCountChanged: update()
        onHeightChanged: update()
        onCursorPositionChanged: update()
    }

    FileDialog {
        id: fileDialogSave
        selectExisting : false
        property var cb
        title: "Please choose a location to save"

        onAccepted: {
            backend.fileUrl = fileDialogSave.fileUrl
            if(cb != undefined) {
                cb()
            }
        }
    }
}
