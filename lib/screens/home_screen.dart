import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectflutterapp/constants/constants.dart';
import 'package:projectflutterapp/main.dart';
import 'package:projectflutterapp/models/Category.dart';
import 'package:projectflutterapp/models/Task.dart';
import 'package:projectflutterapp/screens/SecondScreen.dart';
import 'package:projectflutterapp/screens/addTaskScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectflutterapp/screens/categoriesScreen.dart';
//import 'package:projectflutterapp/screens/friends.dart';
import 'package:projectflutterapp/screens/task_attribute.dart';
import 'package:projectflutterapp/utility/notifications.dart';
import 'package:projectflutterapp/utility/score_shape.dart';
import 'package:projectflutterapp/services/auth.dart';
import 'package:projectflutterapp/screens/first_page.dart';
//import 'package:projectflutterapp/screens/ProfilePage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:projectflutterapp/screens/profile/PrfilePage.dart';
//import 'first_page.dart';
import 'friends_pages/FriendsPages.dart';

final FirstPage firstPage = FirstPage();


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

// Streams are created so that app can respond to notification-related events since the plugin is initialised in the `main` function

NotificationAppLaunchDetails notificationAppLaunchDetails;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int score = 60;
  bool isMore = false;

  int tasksCount;
  Notifications n = Notifications();

  //final AuthServices _auth = AuthServices();

  @override
  void initState() {
    super.initState();
    _requestIOSPermissions();
    _configureDidReceiveLocalNotificationSubject();
    _configureSelectNotificationSubject();
  }

  void _requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) =>
            CupertinoAlertDialog(
              title: receivedNotification.title != null
                  ? Text(receivedNotification.title)
                  : null,
              content: receivedNotification.body != null
                  ? Text(receivedNotification.body)
                  : null,
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text('Ok'),
                  onPressed: () async {
                    Navigator.of(context, rootNavigator: true).pop();
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SecondScreen(receivedNotification.payload),
                      ),
                    );
                  },
                )
              ],
            ),
      );
    });
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String payload) async {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondScreen(payload)),
      );
    });
  }

  @override
  void dispose() {
    didReceiveLocalNotificationSubject.close();
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.brown[400],
//        elevation: 0.0,
//        actions: <Widget>[
//          FlatButton.icon(
//            icon: Icon(Icons.person),
//            label: Text("logout"),
//             onPressed: firstPage.logoutUser,
//          ),
//        ],
//      ),
        backgroundColor: Color(0xff9966FF),
        body: SingleChildScrollView(
            child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
//            margin: EdgeInsets.only(bottom: 10),
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
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width * 1.4 / 4,
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
                                        color: Color(0xffBBB4C9).withOpacity(
                                            .35),
                                        blurRadius: 15.0,
                                        offset: const Offset(0.0, 10.0), //
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        child: SvgPicture.asset(
                                            "assets/images/champion.svg"),
                                      ),
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
                                          Stack(
                                            alignment:
                                            AlignmentDirectional.center,
                                            children: <Widget>[
                                              Container(
                                                  width: 30,
                                                  height: 5,
                                                  decoration:
                                                  BoxDecoration(boxShadow: [
                                                    BoxShadow(
                                                        color: Color(
                                                            0xffFFCC00),
                                                        offset: Offset(0, 2),
                                                        blurRadius: 17,
                                                        spreadRadius: 1)
                                                  ])),
                                              Container(
                                                child: Text(
                                                  score.toString(),
                                                  style: TextStyle(
                                                      fontFamily: "Segoe UI",
                                                      fontSize: 20,
                                                      color: Color(0xffFFCC00),
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ),
                                            ],
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
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 1.2 / 4,
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
                                Navigator.of(context).pushNamed(ADD_NEW_TASK);
                              },
                              child: Container(
                                width:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width * 1.6 / 4,
                                height: 80,
                                decoration: new BoxDecoration(
                                  color: Color(0xffBCAAE0).withOpacity(.35),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0),
                                      bottomLeft: Radius.circular(50),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      "assets/images/ic_plus.svg",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 65),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                          SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(CATEGORIES_SCREEN);
                        },
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          height:
                          MediaQuery
                              .of(context)
                              .size
                              .height * 3.59 / 9,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                  "assets/images/ic_middle.svg"),
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  Container(
                                      width: 130,
                                      height: 5,
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Color(0xffFFCC00),
                                            offset: Offset(0, 2),
                                            blurRadius: 17,
                                            spreadRadius: 1)
                                      ])),
                                  Center(
                                    child: Text("Categories",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontSize: 25,
                                          color: Color(0xffFFCC00),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                        isMore ? showMoreIcons(context) : Container(),
                        SizedBox(height: 20),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          1.2 /
                                          6,
                                      child: SvgPicture.asset(
                                          "assets/images/setting.svg")),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return FriendsPages();
                                        }));
                                  },
                                  child: Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width *
                                          1.2 /
                                          5,
                                      child: SvgPicture.asset(
                                          "assets/images/ic_friends.svg")),
                                ),
                                GestureDetector(
                                  child: Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width *
                                        1.2 /
                                        5,
                                    child: SvgPicture.asset(
                                        "assets/images/circle_share.svg"),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isMore = !isMore;
                                    });
                                  },
                                  child: Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width *
                                        1.2 /
                                        5,
                                    child: SvgPicture.asset(
                                        "assets/images/ic_more.svg"),
                                  ),
                                ),
                              ])),
                      SizedBox(height: 20),
                      FlatButton.icon(
                        icon: Icon(Icons.person),
                        label: Text("logout"),
                        onPressed: firstPage.logoutUser,
                      )
                      ])
                ]))
            ]),
      ),
    ),)
    ,
    );
  }

  Widget showMoreIcons(BuildContext context) {
    return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        margin: EdgeInsets.only(right: 10),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfilePage(userProfileId: currentUser.id);
                    // return MyWidget();
                  }));
                },
                child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 1.2 / 5.3,
                    child: SvgPicture.asset(
                        "assets/images/Profile.svg")), //Profile.svg
              ),
              GestureDetector(
                child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 1.2 / 5,
                    child: SvgPicture.asset(
                        "assets/images/Complitedtasks.svg")), //ic_friends.svg///rating.svg**
              ),
              GestureDetector(
                onTap: () {
                  n.showNotification();
                },
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 1.2 / 5,
                  child: SvgPicture.asset("assets/images/rating.svg"),

                  ///rating.svg**
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMore = !isMore;
                  });
                },
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 1.2 / 5.5,
                  child:
                  SvgPicture.asset("assets/images/about.svg"), //about.svg
                ),
              ),
            ]));
  }

  void taskCount() async {
    tasksCount = await dbHelper.queryTasksCount();
    print(tasksCount);
  }
}
