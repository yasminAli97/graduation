import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectflutterapp/models/Category.dart';
import 'package:projectflutterapp/models/Task.dart';
import 'package:projectflutterapp/screens/addTaskScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectflutterapp/screens/task_attribute.dart';
import 'package:projectflutterapp/utility/sql_helper.dart';

class DoneTasksScreen extends StatefulWidget {
  @override
  _DoneTasksScreen createState() => _DoneTasksScreen();
}

class _DoneTasksScreen extends State<DoneTasksScreen> {
  TextEditingController _searchQuery = TextEditingController();

  final dbHelper = SQL_Helper();
  Future<List<Task>> tasks;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tasks = dbHelper.showDoneTasks();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xffB69EE6),
          body: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        1.4 /
                                        4,
                                    height: 80,
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.1 /
                                                4,
                                        height: 50,
                                        decoration: new BoxDecoration(
                                          color: Color(0xffAB85F6),
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(30)),
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
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: <Widget>[
                                        Container(
                                            width: 55,
                                            height: 5,
                                            decoration:
                                                BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                  color: Color(0xffFFCC00),
                                                  offset: Offset(0, 2),
                                                  blurRadius: 17,
                                                  spreadRadius: 1)
                                            ])),
                                        Wrap(
                                          children: <Widget>[
                                            Text(
                                              "Finished",
                                              style: TextStyle(
                                                  fontFamily: "Segoe UI",
                                                  fontSize: 22,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )
                                      ]),
                                ],
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 1.4 / 4,
                                height: 75,
                                decoration: new BoxDecoration(
                                  color: Color(0xffA57DF4).withOpacity(.35),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0),
                                      bottomLeft: Radius.circular(50),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0)),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      1.6 /
                                      4,
                                  height: 80,
                                  decoration: new BoxDecoration(
                                    color: Color(0xffAB85F6).withOpacity(.35),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(0),
                                        bottomLeft: Radius.circular(50),
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          myFullScreen(),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                )),
          )),
    );
  }

  Widget getTasks() {
    return FutureBuilder<List<Task>>(
        future: tasks,
        builder:
            (BuildContext context, AsyncSnapshot<List<Task>> asyncSnapshot) {
          if (asyncSnapshot.data == null || !asyncSnapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: asyncSnapshot.data.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return taskContainer(asyncSnapshot.data[index]);
                });
          }
        });
  }

  Widget taskContainer(Task task) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.width / 3,
      alignment: AlignmentDirectional.topStart,
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      padding: EdgeInsets.only(left: 20, right: 5, top: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(color: Color(0xff50299F))),
      child: Column(
        children: <Widget>[
          Container(
              alignment: AlignmentDirectional.topStart,
              child: SvgPicture.asset(
                "assets/images/ic_checkkk.svg",
                height: 30,
                width: 50,
              )),
          SizedBox(height: 10),
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                margin: EdgeInsetsDirectional.only(top: 5,end: 50),
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              Container(
                alignment: AlignmentDirectional.centerStart,
                margin: EdgeInsetsDirectional.only(start: 5,),
                child: Text(
                  task.title,
                  style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            task.time,
            style: TextStyle(
                fontFamily: "Segoe UI", fontSize: 10, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget myFullScreen() {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 30, right: 30),
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(color: Color(0xFFD5D5D5), width: 1.5),
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 5),
                child: Icon(Icons.search, color: Color(0xFFD5D5D5)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 16),
                child: new TextField(
                  controller: _searchQuery,
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                    color: Color(0xFFD5D5D5),
                  ),
                  cursorColor: Color(0xFFD5D5D5),
                  decoration: InputDecoration(
                    //   border: InputBorder(),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontFamily: "segoepr",
                      fontSize: 12,
                      color: Color(0xFFD5D5D5),
                    ),

                    filled: true,
                    fillColor: Colors.transparent,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.transparent, width: .5),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        getTasks(),
      ],
    );
  }
}
