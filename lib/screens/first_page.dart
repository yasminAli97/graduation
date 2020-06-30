import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projectflutterapp/screens/home_screen.dart';
import 'package:projectflutterapp/constants/constants.dart';
import 'package:projectflutterapp/models/User.dart';
import 'package:projectflutterapp/screens/create_account_page.dart';
///-------------------------------------------------------------
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectflutterapp/constants/constants.dart';
import 'package:projectflutterapp/models/Category.dart';
import 'package:projectflutterapp/models/Task.dart';
import 'package:projectflutterapp/screens/addTaskScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectflutterapp/screens/categoriesScreen.dart';
import 'package:projectflutterapp/screens/friends.dart';
import 'package:projectflutterapp/screens/task_attribute.dart';
import 'package:projectflutterapp/utility/notifications.dart';

import 'package:projectflutterapp/services/auth.dart';
import 'package:projectflutterapp/screens/first_page.dart';

final  GoogleSignIn gSignIn = GoogleSignIn();
final usersReference = Firestore.instance.collection("users");
final followersReference = Firestore.instance.collection("userFollowers");
final followingReference = Firestore.instance.collection("userFollowing");
final activityFeedReference = Firestore.instance.collection("feed");


final DateTime timestamp = DateTime.now();
User currentUser;

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  logoutUser(){
    gSignIn.signOut();
  }

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  bool isSignedIn = false ;



  ///--------------------------------------//

  ///--------------------------------------//
  loginUser(){
    gSignIn.signIn();
  }
  ///-----------------------------------------------
  Widget buildHomeScreen(){
    return RaisedButton.icon(
      //onPressed: logoutUser,
      icon: Icon(Icons.close),
      label: Text("Sign Out"),
    );
  }
  ///------------------------------------------------
  @override
  Widget build(BuildContext context) {
    if(isSignedIn){
      //return buildHomeScreen();



      return HomeScreen();
    }
    else{
      return buildSignInScreen();
    }
  }


///------------------------------------------------
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    gSignIn.onCurrentUserChanged.listen(
            (gSignInAccount){controlSignIn(gSignInAccount);},
             onError : (gError){print("Error Massage: " + gError);});
    gSignIn.signInSilently(suppressErrors: false).then((gSignInAccount){
      controlSignIn(gSignInAccount);
    }).catchError((gError){
      print("Error Massage: " + gError);
    });
  }

///------------------------------------------
  controlSignIn(GoogleSignInAccount signInAccount) async{
    if(signInAccount != null){
      await saveUserInfoToFirestore();
      setState(() {
        isSignedIn = true;
  });
  }else{
    setState(() {
      isSignedIn = false;
  });
  }
  }
  ///---------------------------------------
  saveUserInfoToFirestore() async{
    final GoogleSignInAccount gCurrentUser = gSignIn.currentUser;
    DocumentSnapshot documentSnapshot = await usersReference.document(gCurrentUser.id).get();

    if(!documentSnapshot.exists){
      //final username = await  Navigator.of(context).pushNamed(CREATE_ACCOUNT_PAGE);
      final username = "null";//await  Navigator.push(context ,MaterialPageRoute(builder: (context) => CreateAccountPage()));
     // Navigator.push(context ,MaterialPageRoute(builder: (context) => CreateAccountPage()));
      //Navigator.of(context).pushNamed(CREATE_ACCOUNT_PAGE);
      usersReference.document(gCurrentUser.id).setData({
        "id": gCurrentUser.id,
        "profileName":gCurrentUser.displayName,
        "username": username,
        "url":gCurrentUser.photoUrl,
        "email": gCurrentUser.email,
        "timestamp": timestamp,
        "bio": "null",
        "score": 0 ,
      });
      documentSnapshot = await usersReference.document(gCurrentUser.id).get();
    }

    currentUser = User.fromDocument(documentSnapshot);
  }
///---------------------------------------//

///------------------------------------------//
  Scaffold buildSignInScreen(){
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [Theme.of(context).accentColor , Theme.of(context).accentColor ],
              )
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: AlignmentDirectional.bottomEnd,
                child: SizedBox(height: 20),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
//                  Text("Done",
//                    style: TextStyle(fontSize: 92.0 , color: Colors.white ,/*fontFamily: "Signatra"*/) ,
//                  ),

                SvgPicture.asset("assets/images/logo.svg",height: 200,width: 200 ,),
                  GestureDetector(
                      onTap: () => loginUser(),
                      child: Container(
                        width: 270.0,
                        height: 65.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/google_signin_button.png"),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                  ),
                ],
              ),
             Container(
                alignment: AlignmentDirectional.bottomEnd,
                child: FlatButton(onPressed: () {
                  setState(() {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  });},
                  child: Text('SKIP',
                  style: TextStyle(fontSize: 20.0 , color: Colors.white ,fontFamily: 'Segoe UI'),

                ),

                ),
              )
            ],
          ),
        )
    );
  }

  ///-------------------------------------------//









}

