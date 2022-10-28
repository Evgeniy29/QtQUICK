import QtQuick 2.12
import QtQuick.Window 2.12

Item {
    width: 300;
    height: 300

    Rectangle {
        id: rect
        width: 100
        height: 100
        anchors.centerIn: parent
        color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
        antialiasing: true


        MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: (mouse)=> {if (mouse.button === Qt.LeftButton)parent.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)}

        onDoubleClicked: {if (mouse.button === Qt.RightButton)rect.rotation = Math.random()*360}

        }
    }
}
