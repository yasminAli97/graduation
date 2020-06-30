/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projectflutterapp/customicons/edit_icons.dart';
import 'package:projectflutterapp/models/User.dart';
import 'package:projectflutterapp/screens/first_page.dart';
import 'package:projectflutterapp/screens/home_screen.dart';
import '../CustomAppBar.dart';
import '../CustomTextField.dart';
*//*import 'first_page.dart';
import 'CustomAppBar.dart';
import 'CustomTextField.dart';*//*
//import 'EditProfile.dart';



class CustomText extends StatelessWidget {
  CustomText(this.text, this.customColor);

  String text;
  Color customColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          color: customColor,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

class CustomColumnText extends StatelessWidget {
  CustomColumnText(this.text0, this.text, this.customColor);

  String text0;
  String text;
  Color customColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        CustomText(text0,customColor),
        CustomText(text,customColor),
      ],
    );
  }
}


class ProfilePage extends StatefulWidget {
  final String userProfileId;

  //const ProfilePage({Key key, this.userProfileId}) : super(key: key);
  ProfilePage({this.userProfileId});
  @override
  State<StatefulWidget> createState() => _ProfilePageState();

}
//final String currentOnlineUserId = currentUser?.id;

class _ProfilePageState extends State<ProfilePage>{
  //final currentUserId= currentUser.id;
  final String currentOnlineUserId = currentUser?.id;


*//*
//final String currentOnlineUserId = currentUser?.id;
  getCurrentOnlineUser() async{
    final GoogleSignInAccount gCurrentUser = gSignIn.currentUser;
    //   DocumentSnapshot documentSnapshot = await usersReference.document(gCurrentUser.id).get();
//    documentSnapshot = await usersReference.document(gCurrentUser.id).get();

    return gCurrentUser.id;
  }*//*

  createProfileTopView(){
    return FutureBuilder(
      // ignore: missing_return
      future: usersReference.document( *//*currentOnlineUserId*//*widget.userProfileId).get(),
      builder: (context, dataSnapshot){
        if(!dataSnapshot.hasData){
          return CircularProgressIndicator();
        }
        User user= User.fromDocument(dataSnapshot.data);

        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(user.url),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black54,
                                blurRadius: 15.0,
                                offset: Offset(0.0, 0.75))
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            CustomAppBar('assets/images/ic_pen_edit.svg', 'Profile',
                                'assets/images/ic_back_arrow.svg',MaterialPageRoute(builder: (context) => HomeScreen()*//*EditProfile(currentUserId: currentUserId)*//* )),
                            SizedBox(
                              height: 35,
                            ),
                            CustomColumnText('Eman', 'Ammm ODOD', Color(0xFF9966FF))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 70),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CustomColumnText('10', 'Friends', Color(0xFF9966FF)),
                              CustomColumnText('15', 'Task', Color(0xFF9966FF)),
                              CustomColumnText('60', 'Score', Color(0xFF9966FF)),
                            ],
                          ),
                          TextFieldItem(ImageIcon(AssetImage('assets/images/ic_mail.png'),color: Color(0xFF9966FF)), '', user.email),
                          TextFieldItem.addSecondIcon(ImageIcon(AssetImage('assets/images/ic_lock.png'),color: Color(0xFF9966FF),), '', user.id,ImageIcon(AssetImage('assets/images/ic_seen.png'),color: Color(0xFF9966FF))),
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 2 / 5 - 60,
                  left: MediaQuery.of(context).size.width / 2 - 60,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.people,
                      size: 60,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          createProfileTopView(),
        ],
      ),
    );
  }
}*/


//import 'dart:html';

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectflutterapp/customicons/edit_icons.dart';
import 'package:projectflutterapp/models/User.dart';
import 'package:projectflutterapp/screens/first_page.dart';

import '../CustomAppBar.dart';
import '../CustomTextField.dart';
//import 'CustomAppBar.dart';
//import 'CustomTextField.dart';
import 'EditProfile.dart';
import 'package:projectflutterapp/customicons/edit_icons.dart' as customicon5;



class CustomText extends StatelessWidget {
  CustomText(this.text, this.customColor);

  String text;
  Color customColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          color: customColor,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

class CustomColumnText extends StatelessWidget {
  CustomColumnText(this.text0, this.text, this.customColor);

  String text0;
  String text;
  Color customColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        CustomText(text0,customColor),
        CustomText(text,customColor),
      ],
    );
  }
}


class ProfilePage extends StatefulWidget {
  final String userProfileId;

  //const ProfilePage({Key key, this.userProfileId}) : super(key: key);
  ProfilePage({this.userProfileId});
  @override
  State<StatefulWidget> createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage>{
  final currentOnlineUserId= currentUser.id;
  bool loading = false;
  int countTotalFollowers = 0;
  int countTotlFollowings = 0;
  bool following = false;

  void initState(){
    getAllFollowers();
    getAllFollowings();
    checkIfAreadyFollowing();
  }

  createProfileTopView(){
    return FutureBuilder(
      // ignore: missing_return
      future: usersReference.document(widget.userProfileId).get(),
      builder: (context, dataSnapshot){
        if(!dataSnapshot.hasData){
          return CircularProgressIndicator();
        }
        User user= User.fromDocument(dataSnapshot.data);

        /*return Scaffold(
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(user.url),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black54,
                                blurRadius: 15.0,
                                offset: Offset(0.0, 0.75))
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            CustomAppBar('assets/images/ic_pen_edit.svg', 'Profile',
                                'assets/images/ic_back_arrow.svg',MaterialPageRoute(builder: (context) => EditProfile(currentUserId: currentUserId) )),
                            SizedBox(
                              height: 35,
                            ),
                            CustomColumnText('Eman', 'Ammm ODOD', Color(0xFF9966FF))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 70),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CustomColumnText('10', 'Friends', Color(0xFF9966FF)),
                              CustomColumnText('15', 'Task', Color(0xFF9966FF)),
                              CustomColumnText('60', 'Score', Color(0xFF9966FF)),
                            ],
                          ),
                          TextFieldItem(ImageIcon(AssetImage('assets/images/ic_mail.png'),color: Color(0xFF9966FF)), '', user.email),
                          TextFieldItem.addSecondIcon(ImageIcon(AssetImage('assets/images/ic_lock.png'),color: Color(0xFF9966FF),), '', user.id,ImageIcon(AssetImage('assets/images/ic_seen.png'),color: Color(0xFF9966FF))),
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 2 / 5 - 60,
                  left: MediaQuery.of(context).size.width / 2 - 60,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.people,
                      size: 60,
                    ),
                  ),
                )
              ],
            ),
          ),
        );*/
        return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/backgroung1noor.png"/*"assets/images/Profile.png"*/),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
                alignment: AlignmentDirectional.topStart,
                child: Column(
                    children: <Widget>[
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
//                           Container(
//                              width: MediaQuery.of(context).size.width * 1.2 / 4,
//                              height: 75,
//                              decoration: new BoxDecoration(
//                              color: Color(0xffBCAAE0).withOpacity(.35),
//                              shape: BoxShape.rectangle,
//                              borderRadius: BorderRadius.only(
//                              bottomRight: Radius.circular(0),
//                              bottomLeft: Radius.circular(50),
//                              topLeft: Radius.circular(0),
//                              topRight: Radius.circular(0)),
//                              //                              boxShadow: [
//                              //                                BoxShadow(
//                              //                                  color: Color(0xffBBB4C9).withOpacity(.35),
//                              //                                  blurRadius: 15.0,
//                              //                                  offset: const Offset(0.0, 10.0),
//                              //                                ),
//                              //                              ],
//                              ),
//                              //child: createButton(/*context*/),
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.push(context,
//                                     MaterialPageRoute(builder: (context) {
//                                       // return EditProfile(currentUserId: currentOnlineUserId);
//                                     }));
//                               },
//                               child: Icon(customicon5.Edit.mode_edit,color:Colors.white,size: 40,),
//                             ),
//                      )

                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      CustomColumnText(user.profileName, user.bio, Colors.white),
                      SizedBox(
                        height: 25,
                      ),
                      /*Positioned(
                        top: MediaQuery.of(context).size.height * 2 / 5 - 60,
                        left: MediaQuery.of(context).size.width / 2 - 60,
                        child:*/ CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.black,
                          backgroundImage: NetworkImage(user.url), /*Icon(
                            Icons.people,
                            size: 60,
                          ),*/
                        ),
                      /*),*/
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                CustomColumnText(countTotalFollowers.toString(), 'Friends', Colors.purple[800]),
                                CustomColumnText('15', 'Tasks', Colors.purple[800]),
                                CustomColumnText(user.score.toString(), 'Score', Colors.purple[800]/*Color(0xFF9966FF)*/),
                              ],
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.email),
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  alignment: Alignment.topLeft,
                                  child: CustomText(user.email,Colors.black),//TextFieldItem(ImageIcon(AssetImage('assets/images/ic_mail.png'),color: Color(0xFF9966FF)), '', 'FayzaElzain@gmail.com'),,
                                ),
                              ],),
                            //TextFieldItem.addSecondIcon(ImageIcon(AssetImage('assets/images/ic_lock.png'),color: Color(0xFF9966FF),), '', '123456789',ImageIcon(AssetImage('assets/images/ic_seen.png'),color: Color(0xFF9966FF))),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      createButton(),

                    ]
                )
            )
        );
      },
    );
  }


  createButton(){
    bool ownProfile = currentOnlineUserId == widget.userProfileId;
    if(ownProfile){
      return createButtonTileAndFunction("Edit Profile" , editUserProfile);
      }
    else if(following){
      return createButtonTileAndFunction("Unfollow" , controlUnFollowUser);
    }
    else if(!following){
      return createButtonTileAndFunction("Follow" , controlFollowUser);
    }
  }

  getAllFollowers() async{
    QuerySnapshot querySnapshot = await followersReference.document(widget.userProfileId)
        .collection("userFollowers").getDocuments();
    setState(() {
      countTotalFollowers = querySnapshot.documents.length;
    });
  }

  checkIfAreadyFollowing() async{
    DocumentSnapshot documentSnapshot = await followersReference
        .document(widget.userProfileId).collection("userFollowers")
        .document(currentOnlineUserId).get();
    setState(() {
      following = documentSnapshot.exists;
    });
  }

  getAllFollowings() async{
    QuerySnapshot querySnapshot = await followingReference .document(widget.userProfileId)
        .collection("userFollowing").getDocuments();
    setState(() {
      countTotlFollowings = querySnapshot.documents.length;
    });
  }

  controlFollowUser(){
    setState((){
      following = true;
    });

    followersReference.document(widget.userProfileId).collection("userFollowers")
        .document(currentOnlineUserId)
        .setData({ });

    followingReference.document(currentOnlineUserId).collection("userFollowing")
        .document(widget.userProfileId)
        .setData({
      /*"profileName": currentUser.profileName,
      "userProfileImg": currentUser.url,
      "score": currentUser.score,*/
    });

    activityFeedReference.document(widget.userProfileId)
        .collection("feedItems").document(currentOnlineUserId)
        .setData({
      "type" : "follow",
      //"ownerId": widget.userProfileId,
      "profileName": currentUser.profileName,
      "timestamp": DateTime.now(),
      "url": currentUser.url,
      "userId": currentOnlineUserId,
      "score": currentUser.score,
    });
  }

  controlUnFollowUser(){
    setState((){
      following = false;
    });

    followersReference.document(widget.userProfileId)
        .collection("userFollowers")
        .document(currentOnlineUserId)
        .get()
        .then((document) {
          if(document.exists){
            document.reference.delete();
          }
    } );

    followingReference.document(currentOnlineUserId)
        .collection("userFollowing")
        .document(widget.userProfileId)
        .get()
        .then((document) {
      if(document.exists){
        document.reference.delete();
      }
    } );

    activityFeedReference.document(widget.userProfileId)
        .collection("feedItems")
        .document(currentOnlineUserId)
        .get()
    .then((document) {
      if(document.exists){
        document.reference.delete();
      }
    });
  }

  Container createButtonTileAndFunction(String title , Function performFunction){
    return Container(
      padding: EdgeInsets.only(bottom: 80.0),
      child: FlatButton(
        onPressed: performFunction,
        child: Container(
          width: 245.0,
          height: 36.0,
          child: Text(title , style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold), ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.purple[900],
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
    );
  }

  editUserProfile(){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EditProfile(currentOnlineUserId: currentOnlineUserId);
    }));
    //Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          createProfileTopView(),
        ],
      ),
    );
  }
}