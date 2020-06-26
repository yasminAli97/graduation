
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:projectflutterapp/models/Task.dart';
import 'package:projectflutterapp/screens/addTaskScreen.dart';

class scoreShape extends StatefulWidget {


  @override
  _scoreShape createState() => _scoreShape();
}

class _scoreShape extends State<scoreShape> {

  int score = 60;

  int arrangment = 1;

  int frinds = 0;
  int tasksCount;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskCount();
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.transparent,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2 + 30,
                margin: EdgeInsets.only(top: 30, left: 15, right: 15),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(color: Color(0xffFFCC00), width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 15.0,
                      offset: const Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: Center(
                  child: Wrap(
                    children: <Widget>[
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          Container(
                            child: SvgPicture.asset(
                                "assets/images/score_stars.svg"),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 25),
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                    "assets/images/score_value.svg"),
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    score.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Segoe UI",
                                        fontSize: 20,
                                        color: Color(0xffFE5F5F)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 25, right: 25),
                        height: 55,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(25),
                          border:
                          Border.all(color: Color(0xff9966FF), width: 4),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                "Arrangement",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontSize: 12,
                                    color: Color(0xffFE5F5F)),
                              ),
                            ),
                            VerticalDivider(
                              width: 2,
                              thickness: 1.5,
                              color: Color(0xffC3B8D9),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 7,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                "Tasks",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontSize: 12,
                                    color: Color(0xffFE5F5F)),
                              ),
                            ),
                            VerticalDivider(
                              width: 2,
                              thickness: 1.5,
                              color: Color(0xffC3B8D9),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 6,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                "Frinds",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontSize: 12,
                                    color: Color(0xffFE5F5F)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          SvgPicture.asset("assets/images/sore_items.svg"),
                          Wrap(
                            children: <Widget>[
                              Container(
                                decoration: new BoxDecoration(
                                    color: Color(0xffBCAAE0).withOpacity(.35),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2.5, color: Color(0xffFFCC00))),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Text(
                                    arrangment.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Segoe UI",
                                        fontSize: 20,
                                        color: Color(0xffFE5F5F)),
                                  ),
                                ),
                              ),
                              Container(
                                width: 10,
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: VerticalDivider(
                                  width: 2,
                                  thickness: 1.5,
                                  color: Color(0xffC3B8D9),
                                ),
                              ),
                              Container(
                                decoration: new BoxDecoration(
                                    color: Color(0xffBCAAE0).withOpacity(.35),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2.5, color: Color(0xffFFCC00))),
                                width: MediaQuery.of(context).size.width / 7,
                                margin: EdgeInsets.only(left: 5, right: 5),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Text(
                                    tasksCount.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Segoe UI",
                                        fontSize: 20,
                                        color: Color(0xffFE5F5F)),
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                width: 2,
                                thickness: 1.5,
                                color: Color(0xffC3B8D9),
                              ),
                              Container(
                                decoration: new BoxDecoration(
                                    color: Color(0xffBCAAE0).withOpacity(.35),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2.5, color: Color(0xffFFCC00))),
                                width: MediaQuery.of(context).size.width / 6,
                                margin: EdgeInsets.only(left: 5, right: 5),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Text(
                                    frinds.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Segoe UI",
                                        fontSize: 20,
                                        color: Color(0xffFE5F5F)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 65,
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Color(0xff9966FF), width: 4),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff9966FF),
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 3.0),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "Score",
                style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: 30,
                    color: Color(0xffFE5F5F)),
              ),
            ),
          )
        ],
      ),
    );

  }

  void taskCount() async{
    int i = await dbHelper.queryTasksCount();
    setState(() {
      tasksCount = i;
    });
    print(tasksCount);
  }
}
