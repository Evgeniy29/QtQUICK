import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: primaryFrame
    width: 500
    height: 500
    visible: true
    title: qsTr(" Registration form ")
    color: "#e5ecef"

    ScrollView {
            id: sview
            anchors.fill: parent
            contentWidth: parent.width  * 2
            contentHeight: parent.height * 2
        ScrollBar.horizontal: ScrollBar { id: hbar; active: vbar.active }
          ScrollBar.vertical: ScrollBar { id: vbar; active: hbar.active }

    Rectangle {
    id: secondaryFrame
    width: 500
    height: 1000
    radius: 5
    anchors.left:  parent
    property string textColor: "Black"

    Column {
    anchors.fill: parent
    padding: 50
    spacing: 3

    Label {
        text: "Enter your email address"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
    id: mailTextField
    anchors.horizontalCenter: parent.horizontalCenter
    placeholderText: qsTr("E-mail")
    color: secondaryFrame.textColor
    }

    Label {
        text: "Enter your username"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
    id: loginTextField
    anchors.horizontalCenter: parent.horizontalCenter
    placeholderText: qsTr("Login")
    color: secondaryFrame.textColor
    }

    Label {
        text: "Enter your password"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
    id: passwordTextField
    echoMode: TextInput.Password
    anchors.horizontalCenter: parent.horizontalCenter
    placeholderText: qsTr("Password")
    color: secondaryFrame.textColor
    }

    Label {
        text: "Enter your phone number"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
    id: phoneTextField
    anchors.horizontalCenter: parent.horizontalCenter
    placeholderText: qsTr("(specify the symbol '+')")
    color: secondaryFrame.textColor
    }

    Label {
        text: "Enter your name "
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
    id: nameTextField
    anchors.horizontalCenter: parent.horizontalCenter
    placeholderText: qsTr("Name")
    color: secondaryFrame.textColor
    }

    Label {
        text: "Enter your last name"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
    id: surnameTextField
    anchors.horizontalCenter: parent.horizontalCenter
    placeholderText: qsTr("Surname")
    color: secondaryFrame.textColor
    }

    Label {
        text: "Enter your patronymic"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
    id: dadnameTextField
    anchors.horizontalCenter: parent.horizontalCenter
    placeholderText: qsTr("Patronymic")
    color: secondaryFrame.textColor
    }

    Label {
        text: "Choose a gender"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    ComboBox {
        id: comboBox1
        model: ["...","Male", "Female"]
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
    id: ageTextField
    anchors.horizontalCenter: parent.horizontalCenter
    placeholderText: qsTr("Enter your age")
    color: secondaryFrame.textColor
    }

    Label {
        text: "Choose your country of residence"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    ComboBox {
        id: comboBox2
        model: ["...", "Russia","United States of America", "Great Britain","Ukraine", "Germany", "China","India" ]
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
        text: "Choose your city of residence"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    ComboBox {
        id: comboBox3
        model: [ "...","Moscow","Washington","London","Kyiv","Berlin","Beijing","Delhi" ]
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
        text: "Choose who is interesting to you"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    ComboBox {
        id: comboBox4
        model: [ "...","Girls", "Boys","Transgender", "Everyone" ]
        anchors.horizontalCenter: parent.horizontalCenter
    }



    Button {
    id: submitButton
    width: 200
    height: 40
    text: qsTr("Registration");
    anchors.horizontalCenter: parent.horizontalCenter
    MouseArea{
        anchors.fill: parent
        onClicked: {
            console.log(qsTr('Data processed successfully:  ' + ' E-mail - ' + mailTextField.text + ' Login - ' + loginTextField.text + ' Password - ' +
                             passwordTextField.text + ' Phone number - ' + phoneTextField.text + ' Name - ' + nameTextField.text + ' Surname - '  +
                             surnameTextField.text + ' Middle name - ' + dadnameTextField.text + ' Age - ' + ageTextField.text + ' Gender - ' + comboBox1.currentText ))
        }
    }
    background: Rectangle {
    color: parent.down ? "#bbbbbb" :(parent.hovered ? "green" : "red")
    }
   }
  }
 }
}
}
