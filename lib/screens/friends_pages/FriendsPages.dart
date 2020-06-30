import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:projectflutterapp/customicons/my_flutter_app_icons.dart' as customicon1;
import 'package:projectflutterapp/customicons/awesome_icon_icons.dart' as customicon2;
import 'package:projectflutterapp/customicons/requests_and_friends_icons.dart' as customicon3;
import 'package:projectflutterapp/customicons/requests_icon_icons.dart' as customicon4;
import 'package:projectflutterapp/customicons/edit_icons.dart' as customicon5;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectflutterapp/models/User.dart';
import 'package:projectflutterapp/screens/edit_friends.dart';
import 'package:projectflutterapp/screens/categoriesScreen.dart';
import 'package:projectflutterapp/screens/first_page.dart';
import 'package:projectflutterapp/screens/friends_pages/Exp.dart';
import 'package:projectflutterapp/screens/friends_pages/ScoreBoard.dart';
import 'package:projectflutterapp/screens/home_screen.dart';
import 'package:projectflutterapp/screens/profile/PrfilePage.dart';
import 'Friends.dart';
import 'SearchPage.dart';
//import 'Requests.dart';


class FriendsPages extends StatefulWidget {
  FriendsPages({Key key}) : super(key: key);
  @override
  _FriendsPagesState createState() => _FriendsPagesState();
}

class _FriendsPagesState extends State<FriendsPages> {

  static TextEditingController _searchFriendQuery = TextEditingController();
  static TextEditingController _searchFriendScoreQuery = TextEditingController();

  int _currentIndex =0;
  final tabs =[
    ScoreBoard(),//Friends(),
    Notifications(), /*Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              "FRIENDS REQUESTS",
              style: TextStyle(
                  fontFamily: "Segoe UI",
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    ),*///Notifications(),
    /*Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Score Board",
              style: TextStyle(
                  fontFamily: "Segoe UI",
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          *//*TextField(
            controller: _searchFriendScoreQuery,
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
          ),*//*
          SizedBox(height: 10),
          Container(
            //width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 30, right: 30),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                  color: Color(0xFFD5D5D5), width: 1.5),
            ),
            child:  Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 5),
                  child: Icon(Icons.search , color: Color(0xFFD5D5D5)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35,top: 16),
                  child: TextField(
                    controller: _searchFriendScoreQuery,
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
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    ),*/
    SearchPage()//ExpPage(),// Container(child: Text("search")),//SearchPage(),//search//
  ];

  @override
  void initState() {
//     TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            onTap: (index){
              setState((){_currentIndex =index;});
            },
            height: 50,
            color: Colors.white,
            backgroundColor:Color(0xff9F70FC),//D2CADE#
            buttonBackgroundColor: Colors.white,
//          type: BottomNavigationBarType.fixed,
//          selectedFontSize: 20,
//          unselectedFontSize: 10,
//          iconSize: 20,
//          currentIndex: 0,
            items:[
              Icon(customicon3.RequestsAndFriends.icon_people,color:Colors.black  ,size:20 ,),
              Icon(customicon4.RequestsIcon.icon_requests,color: Colors.black,),
              //Icon(customicon2.AwesomeIcon.icon_awesome_hackerrank,color: Colors.black,),
              Icon(Icons.search),
            ],
          ),
          body: ListView(
              shrinkWrap: true,//****/
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  //            margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/backgroung1noor.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
//
                  child: Column(children: <Widget>[
                    Container(
                        alignment: AlignmentDirectional.topStart,
                        child: Column(children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
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
                                                  "assets/images/ic_back_arrow.svg")
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 1.2 / 7,
                                height: 70,
                                decoration: new BoxDecoration(
                                  color: Color(0xffBCAAE0).withOpacity(.35),
                                  shape: BoxShape.circle/*rectangle,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(0),
                                      bottomLeft: Radius.circular(50),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0)),*/
                                ),
                                //child: GestureDetector(
                                  //onTap: displayUserProfile(context,userProfileId: currentUser.id),
                                  child:Padding(
                                    padding: EdgeInsets.only(right:8.0),
                                    child:CircleAvatar(
                                      radius: 2.0,
                                      backgroundColor: Colors.black,
                                      backgroundImage: NetworkImage(currentUser.url),
                                    ) ,
                                  )

                                //),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  /*width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: 30, right: 30),
                              height: 40,*/
                                  /*decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                    color: Color(0xFFD5D5D5), width: 1.5),
                              ),*/
                                  child: Container(
                                    child: tabs[_currentIndex],
                                  ),
                                ),


                              ])
                          //                  container [-[-> tabs
                        ]))
                  ]),
                ),
              ]
          ),

        ),
      ),
    );
  }
  displayUserProfile(BuildContext context , {String userProfileId}){
    Navigator.push(context , MaterialPageRoute(builder: (context) => ProfilePage(userProfileId: userProfileId)));
  }
}