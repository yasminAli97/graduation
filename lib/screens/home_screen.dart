import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectflutterapp/models/Category.dart';
import 'package:projectflutterapp/models/Task.dart';
import 'package:projectflutterapp/screens/addTaskScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectflutterapp/screens/categoriesScreen.dart';

import 'package:projectflutterapp/screens/task_attribute.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<Task> tasks = List<Task>();
  List<Category> categories = List<Category>();

  TextEditingController controller = TextEditingController();

  TextEditingController _searchQuery = TextEditingController();

  int score = 60;

  int arrangment =5;

  int frinds = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(children: <Widget>[
              Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => Center(child: scoreShape()));
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 1.4 / 4,
                                height: 80,
                                decoration: new BoxDecoration(
                                  color: Color(0xffA57DF4),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(0),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0)),
//                                      border: Border(
//                                        right: BorderSide(
//                                          color: Colors.white,
//                                          width: 1.0,
//
//                                        ),
//                                        top: BorderSide(
//                                          color: Colors.white,
//                                          width: 1.0,
//                                        ),
//                                      ),

                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffBBB4C9).withOpacity(.35),
                                      blurRadius: 15.0,
                                      offset: const Offset(0.0, 10.0),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                        child: SvgPicture.asset(
                                            "assets/images/score.svg")),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            "Score",
                                            style: TextStyle(
                                              fontFamily: "Segoe UI",
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            score.toString(),
                                            style: TextStyle(
                                              fontFamily: "Segoe UI",
                                              fontSize: 20,
                                              color: Color(0xffFFCC00),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 1.2 / 4,
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return AddNewTaskScreen();
                                  }));
                            },
                            child: Container(
                              width:
                                  MediaQuery.of(context).size.width * 1.6 / 4,
                              height: 80,
                              decoration: new BoxDecoration(
                                color: Color(0xffBCAAE0).withOpacity(.35),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(50),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0)),
//                                      border: Border(
//                                        right: BorderSide(
//                                          color: Colors.white,
//                                          width: 1.0,
//
//                                        ),
//                                        top: BorderSide(
//                                          color: Colors.white,
//                                          width: 1.0,
//                                        ),
//
//                                      ),
                              ),
                              child: SvgPicture.asset(
                                "assets/images/ic_plus.svg",
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(left: 30, right: 30),
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                  color: Color(0xFFD5D5D5), width: 1.5),
                            ),
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

                                prefix: Icon(Icons.search,
                                    color: Color(0xFFD5D5D5)),
                                filled: true,
                                fillColor: Colors.transparent,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CategoriesScreen();
                              }));
                            },
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              height:
                                  MediaQuery.of(context).size.height * 4 / 9,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  SvgPicture.asset(
                                      "assets/images/ic_middle.svg"),
                                  Center(
                                    child: Text("Categories",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontSize: 25,
                                          color: Color(0xffFFCC00),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.2 /
                                              6,
                                          child: SvgPicture.asset(
                                              "assets/images/setting.svg")),
                                    ),
                                    GestureDetector(
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.2 /
                                              5,
                                          child: SvgPicture.asset(
                                              "assets/images/ic_friends.svg")),
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.2 /
                                                5,
                                        child: SvgPicture.asset(
                                            "assets/images/circle_share.svg"),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.2 /
                                                5,
                                        child: SvgPicture.asset(
                                            "assets/images/ic_more.svg"),
                                      ),
                                    ),
                                  ]))
                        ])
                  ]))
            ]),
          )
        ],
      ),
    );
  }


  Widget scoreShape() {
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
                            child:
                                SvgPicture.asset("assets/images/score_stars.svg"),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 25),
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: <Widget>[
                                SvgPicture.asset("assets/images/score_value.svg"),
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
                          border: Border.all(color: Color(0xff9966FF), width: 4),
                        ),

                        child: Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width/4,
                              margin: EdgeInsets.only(left: 5 , right: 5),
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
                              color:Color(0xffC3B8D9),

                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/7,
                              margin: EdgeInsets.only(left: 5 , right: 5),
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
                              color:Color(0xffC3B8D9),

                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/6,
                              margin: EdgeInsets.only(left: 5 , right: 5),
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
                                  border: Border.all(width: 2.5 , color: Color(0xffFFCC00))
                                ),
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
                                  color:Color(0xffC3B8D9),

                                ),
                              ),
                              Container(
                                decoration: new BoxDecoration(
                                    color: Color(0xffBCAAE0).withOpacity(.35),
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 2.5 , color: Color(0xffFFCC00))
                                ),
                                width: MediaQuery.of(context).size.width/7,
                                margin: EdgeInsets.only(left: 5 , right: 5),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Text(
                                    tasks.length.toString(),
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
                                color:Color(0xffC3B8D9),

                              ),
                              Container(
                                decoration: new BoxDecoration(
                                    color: Color(0xffBCAAE0).withOpacity(.35),
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 2.5 , color: Color(0xffFFCC00))
                                ),
                                width: MediaQuery.of(context).size.width/6,
                                margin: EdgeInsets.only(left: 5 , right: 5),
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
}

class Chevron extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width / 7, size.height);
    path.lineTo(size.width * 6 / 7, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width * 6 / 7, 0);
    path.lineTo(size.width / 7, 0);
    path.moveTo(size.width / 2, size.height / 2);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}