import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectflutterapp/constants/constants.dart';
import 'package:projectflutterapp/main.dart';
import 'package:projectflutterapp/models/Category.dart';
import 'package:projectflutterapp/models/Task.dart';
import 'package:projectflutterapp/screens/DoneTasksScreen.dart';
import 'package:projectflutterapp/screens/MustRegisterScreen.dart';
import 'package:projectflutterapp/screens/SecondScreen.dart';
import 'package:projectflutterapp/screens/addTaskScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectflutterapp/screens/categoriesScreen.dart';
import 'package:projectflutterapp/screens/friends_pages/Friends.dart';

//import 'package:projectflutterapp/screens/friends.dart';
import 'package:projectflutterapp/screens/task_attribute.dart';
import 'package:projectflutterapp/utility/notifications.dart';
import 'package:projectflutterapp/utility/scoreWidget.dart';
import 'package:projectflutterapp/screens/first_page.dart';

//import 'package:projectflutterapp/screens/ProfilePage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projectflutterapp/screens/profile/PrfilePage.dart';
import 'friends_pages/FriendsPages.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:share/share.dart';

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
  double _ratingStar = 0;
  bool isMore = false;

  Notifications n = Notifications();
  int scory;

  String text = 'https://www.youtube.com';
  String subject = 'Done App';
  //final AuthServices _auth = AuthServices();

  @override
  void initState() {
    super.initState();
    _requestIOSPermissions();
    _configureDidReceiveLocalNotificationSubject();
    _configureSelectNotificationSubject();
    addDefCat();
    addScore();
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
        builder: (BuildContext context) => CupertinoAlertDialog(
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
        backgroundColor: Color(0xff9966FF),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
                alignment: AlignmentDirectional.topStart,
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => Center(child: ScoreShape(scory)));
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
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffBBB4C9).withOpacity(.35),
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
                                      "assets/images/champion.svg",
                                      width: 45,
                                      height: 45,
                                    ),
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
                                        alignment: AlignmentDirectional.center,
                                        children: <Widget>[
                                          Container(
                                              width: 25,
                                              height: 5,
                                              decoration:
                                                  BoxDecoration(boxShadow: [
                                                BoxShadow(
                                                    color: Color(0xffFFCC00),
                                                    offset: Offset(0, 2),
                                                    blurRadius: 17,
                                                    spreadRadius: 1)
                                              ])),
                                          Container(
                                            child: Text(
                                              scory.toString(),
                                              style: TextStyle(
                                                  fontFamily: "Segoe UI",
                                                  fontSize: 20,
                                                  color: Color(0xffFFCC00),
                                                  fontWeight: FontWeight.bold),
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
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(ADD_NEW_TASK);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.6 / 4,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  SizedBox(height: 45),
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                      Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(CATEGORIES_SCREEN);
                      },
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        height: MediaQuery.of(context).size.height * 4 / 9,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            SvgPicture.asset("assets/images/ic_middle.svg"),
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
                    Stack(children: <Widget>[
                      if (isMore) showMoreIcons(context),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 65),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          1.2 /
                                          6,
                                      child: SvgPicture.asset(
                                          "assets/images/setting.svg")),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        //MustRegisterScreen
                                        MaterialPageRoute(builder: (context) {
                                      return Friends();
                                    }));
                                  },
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          1.2 /
                                          5,
                                      child: SvgPicture.asset(
                                          "assets/images/ic_friends.svg")),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    final RenderBox box = context.findRenderObject();
                                    Share.share(text,
                                        subject: subject,
                                        sharePositionOrigin:
                                        box.localToGlobal(Offset.zero) &
                                        box.size);
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
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
                                    width: MediaQuery.of(context).size.width *
                                        1.2 /
                                        5,
                                    child: SvgPicture.asset(
                                        "assets/images/ic_more.svg"),
                                  ),
                                )
                              ],
                            ),
                            FlatButton.icon(
                              icon: Icon(Icons.person),
                              label: Text("logout"),
                              onPressed: firstPage.logoutUser,
                            )
                          ],
                        ),
                      )
                    ])
                  ])
                ])),
          ),
        ),
      ),
    );
  }

  Widget showMoreIcons(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(right: 10),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    if (currentUser == null) return MustRegisterScreen();
                    return ProfilePage(userProfileId: currentUser.id);
                    // return MyWidget();
                  }));
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 1.2 / 5.3,
                    child: SvgPicture.asset(
                        "assets/images/Profile.svg")), //Profile.svg
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DoneTasksScreen();

                    // return MyWidget();
                  }));
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 1.2 / 5,
                    child: SvgPicture.asset(
                        "assets/images/Complitedtasks.svg")), //ic_friends.svg///rating.svg**
              ),
              GestureDetector(
                onTap: (){
                  showDialog(
                      context: context, builder: (_) => showAlert(task));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.2 / 5,
                  child: SvgPicture.asset("assets/images/rating.svg"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  n.showNotification();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.2 / 5.5,
                  child:
                  SvgPicture.asset("assets/images/about.svg"), //about.svg
                ),
              ),
            ]));
  }

  void addDefCat() async {
    Category default1 = new Category.withTitle('Default');
    int i = await dbHelper.queryCategoriesCount();
    if (i == 0) addCategory(default1);
  }

  void addCategory(Category category) async {
    int result = await dbHelper.insertCategory(category);

    if (result == 0) {
      print("Error");
    } else {
      print("Success");
    }
  }

  void addScore() async {
    Score score = new Score(50);
    int i = await dbHelper.queryScoresCount();
    print("$i score");
    if (i == 0)
      addScoree(score);
    else
      w();
  }

  void addScoree(Score score) async {
    int result = await dbHelper.insertScore(score);
    if (result == 0) {
      print("Error");
    } else {
      w();
      print("Sucsses2");
    }
  }

  void w() async {
    List<Score> ss;
    ss = await dbHelper.showScore();
    print("$ss Anaaaasss");

    setState(() {
      scory = ss.first.score;
    });

    print("$scory Anaaaa");
  }

  Widget showAlert(Task task) {
    Widget cancelButton = FlatButton(
      child: Text("Cancel", style: TextStyle(
        fontFamily: "Segoe UI",
        fontSize: 20,
        color: Colors.purple,
      )),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Done", style: TextStyle(
        fontFamily: "Segoe UI",
        fontSize: 20,
        color: Colors.purple,
      )),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    return AlertDialog(
      title: Text("Rate App", style: TextStyle(
        fontFamily: "Segoe UI",
        fontSize: 25,
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      )),
      elevation: 5,
      actions: [
        cancelButton,
        continueButton,
      ],
      content: Container(
        height: 100,
        child: RatingBar(
          onRatingChanged: (rating) => setState(() => _ratingStar = rating),
          filledIcon: Icons.star,
          filledColor: Colors.amber,
          emptyIcon: Icons.star_border,
        ),
      ),
    );
  }


}
