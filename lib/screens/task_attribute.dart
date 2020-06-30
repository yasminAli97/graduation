import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectflutterapp/models/Task.dart';
import 'package:projectflutterapp/screens/addTaskScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectflutterapp/utility/sql_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TaskAttribute extends StatefulWidget {
  Task task;

  TaskAttribute(this.task);

  @override
  _TaskAttribute createState() => _TaskAttribute(task);
}

class _TaskAttribute extends State<TaskAttribute> {
  Task task;

  _TaskAttribute(this.task);

  final dbHelper = SQL_Helper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff9966FF),
          body: ListView(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: AlignmentDirectional.topStart,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          1.6 /
                                          4,
                                      height: 75,
                                      decoration: new BoxDecoration(
                                        color: Color(0xffA57DF4),
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(50),
                                            bottomLeft: Radius.circular(0),
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(0)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xffBBB4C9)
                                                .withOpacity(.35),
                                            blurRadius: 15.0,
                                            offset: const Offset(0.0, 10.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.2 /
                                              4,
                                          height: 50,
                                          decoration: new BoxDecoration(
                                            color: Color(0xffAB85F6),
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(30)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              SvgPicture.asset(
                                                  "assets/images/ic_back_arrow.svg"),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                                Container(
                                    width: 60,
                                    height: 50,
                                    alignment: AlignmentDirectional.topCenter,
                                    child: Text(
                                      "5 points", //task.hardness*5
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontSize: 15,
                                          color: Color(0xffFFCC00)),
                                    )),
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      1.6 /
                                      4,
                                  height: 75,
                                  decoration: new BoxDecoration(
                                    color: Color(0xffBCAAE0).withOpacity(.35),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(0),
                                        bottomLeft: Radius.circular(50),
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0)),
//                              boxShadow: [
//                                BoxShadow(
//                                  color: Color(0xffBBB4C9).withOpacity(.35),
//                                  blurRadius: 15.0,
//                                  offset: const Offset(0.0, 10.0),
//                                ),
//                              ],
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        1.6 /
                                        4,
                                    height: 75,
                                    decoration: new BoxDecoration(
                                      color: Color(0xffBCAAE0).withOpacity(.35),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(0),
                                          bottomLeft: Radius.circular(50),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0)),
//                                    border: Border(
//                                      right: BorderSide(
//                                        color: Colors.white,
//                                        width: 1.0,
//
//                                      ),
//                                      top: BorderSide(
//                                        color: Colors.white,
//                                        width: 1.0,
//                                      ),
//                                    ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  Container(
                                      width: 55,
                                      height: 5,
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Color(0xffFFCC00),
                                            offset: Offset(0, 2),
                                            blurRadius: 17,
                                            spreadRadius: 1)
                                      ])),
                                  Container(
                                      width: 60,
                                      height: 50,
                                      alignment: AlignmentDirectional.topCenter,
                                      child: Text(
                                        task.title,
                                        style: TextStyle(
                                            fontFamily: "Segoe UI",
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ]),
                            Container(
                                alignment: AlignmentDirectional.topStart,
                                margin: EdgeInsets.only(left: 40, right: 20),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: SvgPicture.asset(
                                            "assets/images/ic_task.svg")),
                                    SizedBox(height: 10),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          task.title,
                                          style: TextStyle(
                                              fontFamily: "Segoe UI",
                                              fontSize: 35,
                                              color: Colors.white),
                                        ),
                                        SizedBox(width: 30),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              "assets/images/ic_check.svg"),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return AddNewTaskScreen();
                                          }));
                                    },
                                    child: SvgPicture.asset("assets/images/edit.svg")),
                                GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) => showAlert());
                                    },
                                    child: SvgPicture.asset(
                                        "assets/images/close.svg")),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              alignment: AlignmentDirectional.center,
                              child:
                                  SvgPicture.asset("assets/images/share.svg"),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }

  Widget showAlert() {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 2.1 / 5,
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 15,
                right: 15,
              ),
              margin: EdgeInsets.only(left: 25, right: 25, top: 20),
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff7DE82B),
                    blurRadius: 15.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 2.6 / 15),
                    alignment: AlignmentDirectional.center,
                    child: Text("Are you sure to delete this task ?",
                        textAlign: TextAlign.start,
                        style: (TextStyle(
                            fontFamily: "Segoe UI",
                            color: Color(0xFF666666),
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(height: 30),
                  Container(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          deleteTask(task);
                        });
                        // To close the dialog
                      },
                      child: Text("OK",
                          textAlign: TextAlign.center,
                          style: (TextStyle(
                              fontFamily: "Segoe UI",
                              color: Color(0xFFE24C4B),
                              fontSize: 25,
                              fontWeight: FontWeight.bold))),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 2.4 / 15,
                  margin: EdgeInsets.only(left: 25, right: 25, top: 20),
                  alignment: AlignmentDirectional.topStart,
                  decoration: new BoxDecoration(
                      color: Color(0xff7DE82B),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 20, bottom: 25),
                          width: 55,
                          height: 10,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color(0xffF2ECD5),
                                offset: Offset(2, 2),
                                blurRadius: 17,
                                spreadRadius: 10)
                          ])),
                      Container(
                        margin: EdgeInsets.only(left: 15, bottom: 20),
                        alignment: AlignmentDirectional.bottomStart,
                        child: Text(
                          "Delete",
                          textAlign: TextAlign.start,
                          style: (TextStyle(
                              fontFamily: "Segoe UI",
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 22,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Color(0xff7DE82B),
                        radius: 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.of(context).pop();
                          });
                        },
                        child: CircleAvatar(
                          backgroundImage:
                          AssetImage("assets/images/circle_close.png"),
                          radius: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void deleteTask(Task task) async {
    int result = await dbHelper.deleteTask(task.id);

    if (result == 0) {
      Fluttertoast.showToast(
          msg: "Task not deleted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Navigator.of(context).pop();
      Fluttertoast.showToast(
          msg: "Task has been deleted successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
      Navigator.of(context).pop();
    }
  }
}
