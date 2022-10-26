#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QMessageBox>
#include <QPushButton>
#include <QPropertyAnimation>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}



void MainWindow::on_pushButton_clicked()
{
    QPushButton *pushButton = new QPushButton(tr("Login"), this);
    QPropertyAnimation *animation = new QPropertyAnimation(pushButton, "pos", this);
    animation->setDuration(1000);
    animation->setStartValue(QPoint(0, 0));
    animation->setEndValue(QPoint(250, 250));
    animation->start();

    QString login = "username";
    ui->lineEdit->setText("Login");

    QString password = ui->lineEdit_2->text();
    ui->lineEdit_2->setText("Password");
        if (password == "admin" ) {
            QMessageBox::information(this, "Login_msg", "Login and password is True");
        }
        else {
            QMessageBox::warning(this,"Login_msg", "Login and password is False");
        }
}
