import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    width: 300
    height: 300
    visible: true
    title: qsTr("Geron")

    property real a
    property real b
    property real c
    property real p
    property real q
    property real s

     GridLayout{
        rows: 3
        columns: 6
        Label {
            text: "by Geron"
            font.pixelSize: 16
            Layout.row: 0
            Layout.column: 0
        }
        Label {
            text: " side a:"
            font.pixelSize: 14
            Layout.row: 2
            Layout.column: 0
        }
        TextField{
            id:a_side
            placeholderText: "A"
            validator: RegExpValidator{
                regExp: /^-?[0-9,.]{7}/
            }
            Layout.row: 2
            Layout.column: 1
        }
        Label {
            text: " side b:"
            font.pixelSize: 14
            Layout.row: 3
            Layout.column: 0
        }
        TextField{
            id:b_side
            placeholderText: "B"
            validator: RegExpValidator{regExp: /^-?[0-9,.]{7}/}
            Layout.row: 3
            Layout.column: 1
        }
        Label {
            text: " side c:"
            font.pixelSize: 14
            Layout.row: 4
            Layout.column: 0
        }
        TextField{
            id:c_side
            placeholderText: "C"
            validator: RegExpValidator{regExp: /^-?[0-9,.]{7}/}
        }
        Label {
            text: " S= "
            font.pixelSize: 16
            Layout.row: 6
            Layout.column: 0
        }
        Label{
            id:tr_s
            Layout.row: 6
            Layout.column: 1
        }
        Button {
            id:calculatebtn
            text: "Calculate"
            onClicked: calculate1()
            Layout.row: 5
            Layout.column: 1
        }
}
    function calculate1()
    {
        if(a_side.text && b_side.text && c_side.text)
        {
            a = a_side.text
            b = b_side.text
            c = c_side.text
            p = (a+b+c) / 2
            q = p*((p-a)*(p-b)*(p-c))
            s = Math.sqrt(q)
            tr_s.text = s
        }
    }


}


