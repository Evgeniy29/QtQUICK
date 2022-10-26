import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 600
    height: 280
    title: qsTr("Coord Triangle")

    property real x1
    property real x2
    property real x3
    property real y1
    property real y2
    property real y3
    property real s2

    GridLayout{
        rows: 3
        columns: 6

        Label {
            text: "by coordinates"
            font.pixelSize: 16
            Layout.row: 0
            Layout.column: 3
        }
        Label {
            text: "coord a:"
            font.pixelSize: 14
            Layout.row: 2
            Layout.column: 3
        }
        TextField{
            id:x1_point
            validator: RegExpValidator{regExp: /^-?[0-9,.]{7}/}
            placeholderText: "X1"
            Layout.row: 2
            Layout.column: 4
        }
        TextField{
            id:y1_point
            validator: RegExpValidator{regExp: /^-?[0-9,.]{7}/}
            placeholderText: "Y1"
            Layout.row: 2
            Layout.column: 5
        }
        Label {
            text: "coord b:"
            font.pixelSize: 14
            Layout.row: 3
            Layout.column: 3
        }
        TextField{
            id:x2_point
            validator: RegExpValidator{regExp: /^-?[0-9,.]{7}/}
            placeholderText: "X2"
            Layout.row: 3
            Layout.column: 4
        }
        TextField{
            id:y2_point
            validator: RegExpValidator{regExp: /^-?[0-9,.]{7}/}
            placeholderText: "Y2"
            Layout.row: 3
            Layout.column: 5
        }
        Label {
            text: "coord c:"
            font.pixelSize: 14
            Layout.row: 4
            Layout.column: 3
        }
        TextField{
            id:x3_point
            validator: RegExpValidator{regExp: /^-?[0-9,.]{7}/}
            placeholderText: "X3"
            Layout.row: 4
            Layout.column: 4
        }
        TextField{
            id:y3_point
            validator: RegExpValidator{regExp: /^-?[0-9,.]{7}/}
            placeholderText: "Y3"
            Layout.row: 4
            Layout.column: 5
        }
        Label {
            text: " S= "
            font.pixelSize: 16
            Layout.row: 6
            Layout.column: 3
        }
        Label{
            id:tr_s2
            Layout.row: 6
            Layout.column: 4
        }
        Button {
            id:calculatebtn2
            text: "Calculate"
            onClicked: calculate2()
            Layout.row: 5
            Layout.column: 5
        }
        Label{
            Layout.row: 0
            Layout.column: 2
            text: "         "
        }
    }


    function calculate2(){
        if(x1_point.text && x2_point.text && x3_point.text &&
                y1_point.text && y2_point.text && y3_point.text){
            x1 = x1_point.text
            x2 = x2_point.text
            x3 = x3_point.text
            y1 = y1_point.text
            y2 = y2_point.text
            y3 = y3_point.text
            s2 = (((x2-x1)*(y3-y1))-((x3-x1)*(y2-y1))) / 2
            if(s2 < 0){
                s2 *= -1;
            }

            tr_s2.text = s2
        }
    }
}

