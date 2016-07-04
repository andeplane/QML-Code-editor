import QtQuick 2.7
import QtQuick.Controls 1.5
import LineNumbers 1.0

Item {
    property alias text: textArea.text


    LineNumbers {
        id: lineNumbers
        height: parent.height
        width: 40
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
        onSelectedTextChanged: {
            console.log("selectionStart: ", selectionStart)
            console.log("selectionEnd: ", selectionEnd)
        }

        onLineCountChanged: update()
        onHeightChanged: update()
        onCursorPositionChanged: update()
    }
}
