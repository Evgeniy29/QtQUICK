import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.1
import QtQuick.LocalStorage 2.14

import "d_load.js" as Backend

ApplicationWindow {
    id: rootWindow
    visible: true
    width: 420
    height: 680
    title: qsTr("Login")

    property color backGroundColor : "#394454"
    property color mainAppColor: "#6fda9c"
    property color mainTextCOlor: "#f0f0f0"
    property color popupBackGroundColor: "#b44"
    property color popupTextCOlor: "#ffffff"
    property var dataBase



    StackView{
        id: stackView
        focus: true
        anchors.fill: parent
    }

    Component.onCompleted: {
        stackView.push("qrc:/log_pass.qml")
        dataBase = userDataBase()
        console.log(dataBase.version)
    }

    Popup {
        id: popup
        property alias popMessage: message.text

        background: Rectangle {
            implicitWidth: rootWindow.width
            implicitHeight: 60
            color: popupBackGroundColor
        }
        y: (rootWindow.height - 60)
        modal: true
        focus: true
        closePolicy: Popup.CloseOnPressOutside
        Text {
            id: message
            anchors.centerIn: parent
            font.pointSize: 12
            color: popupTextCOlor
        }
        onOpened: popupClose.start()
    }

    Timer {
        id: popupClose
        interval: 2000
        onTriggered: popup.close()
    }

    function userDataBase()
    {
        var db = LocalStorage.openDatabaseSync("UserLoginApp", "1.0", "Login example!", 1000000);
        db.transaction(function(tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS UserDetails(username TEXT, password TEXT, hint TEXT)');
        })

        return db;
    }

    function registerNewUser(uname, pword, pword2, hint)
    {
        var ret  = Backend.validateRegisterCredentials(uname, pword, pword2, hint)
        var message = ""
        switch(ret)
        {
        case 0: message = "That's right !"
            break;
        case 1: message = "Incorrect data !"
            break;
        case 2: message = "The password is not correct !"
            break;
        }

        if(0 !== ret)
        {
            popup.popMessage = message
            popup.open()
            return
        }

        dataBase.transaction(function(tx) {
            var results = tx.executeSql('SELECT password FROM UserDetails WHERE username=?;', uname);
            console.log(results.rows.length)
            if(results.rows.length !== 0)
            {
                popup.popMessage = "There is already a user with that name!"
                popup.open()
                return
            }
            tx.executeSql('INSERT INTO UserDetails VALUES(?, ?, ?)', [ uname, pword, hint ]);
            showUserInfo(uname)
        })
    }

    function loginUser(uname, pword)
    {
        var ret  = Backend.validateUserCredentials(uname, pword)
        var message = ""
        if(ret)
        {
            message = "Incorrect credentials!"
            popup.popMessage = message
            popup.open()
            return
        }

        dataBase.transaction(function(tx) {
            var results = tx.executeSql('SELECT password FROM UserDetails WHERE username=?;', uname);
            if(results.rows.length === 0)
            {
                message = "A user with this name is not registered!"
                popup.popMessage = message
                popup.open()
            }
            else if(results.rows.item(0).password !== pword)
            {
                message = "Incorrect credentials!"
                popup.popMessage = message
                popup.open()
            }
            else
            {
                console.log("You have successfully logged in!")
                showUserInfo(uname)
            }
        })
    }

    function retrievePassword(uname, phint)
    {
        var ret  = Backend.validateUserCredentials(uname, phint)
        var message = ""
        var pword = ""
        if(ret)
        {
            message = "No data available!"
            popup.popMessage = message
            popup.open()
            return ""
        }

        console.log(uname, phint)
        dataBase.transaction(function(tx) {
            var results = tx.executeSql('SELECT password FROM UserDetails WHERE username=? AND hint=?;', [uname, phint]);
            if(results.rows.length === 0)
            {
                message = "User not found!"
                popup.popMessage = message
                popup.open()
            }
            else
            {
                pword = results.rows.item(0).password
            }
        })
        return pword
    }

    function showUserInfo(uname)
    {
        stackView.replace("qrc:/UserInfoPage.qml", {"userName": uname})
    }

    function logoutSession()
    {
        stackView.replace("qrc:/log_pass.qml")
    }

    function forgotPassword()
    {
        stackView.replace("qrc:/PasswordResetPage.qml")
    }

    function showAllUsers()
    {
        dataBase.transaction(function(tx) {
            var rs = tx.executeSql('SELECT * FROM UserDetails');
            var data = ""
            for(var i = 0; i < rs.rows.length; i++) {
                data += rs.rows.item(i).username + "\n"
            }
            console.log(data)
        })

    }
}
