import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectflutterapp/models/User.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:projectflutterapp/screens/first_page.dart';

import '../CustomAppBar.dart';
import '../CustomTextField.dart';
//import 'CustomAppBar.dart';
//import 'CustomTextField.dart';
import 'package:projectflutterapp/screens/profile/PrfilePage.dart';

//import '../first_page.dart';
//import '../first_page.dart';

class EditProfile extends StatefulWidget {
  final String currentOnlineUserId;

 // const EditProfile({Key key, this.currentOnlineUserId}) : super(key: key);
  EditProfile({this.currentOnlineUserId});

  @override
  State<StatefulWidget> createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {

  TextEditingController profileNameTextEditingController = TextEditingController();
  TextEditingController bioTextEditingController = TextEditingController();

  final _scaffoldGlobalKey = GlobalKey<ScaffoldState>();
  bool loading=false;
  User user;

  bool _bioValid = true;
  bool _profileNameValid= true;




  void initState() {
    super.initState();
    getAndDisplayUserInformation();
  }

  getAndDisplayUserInformation() async{
    setState(() {
      loading = true ;
    });

    DocumentSnapshot documentSnapshot = await usersReference.document(widget.currentOnlineUserId).get();
    user = User.fromDocument(documentSnapshot);

    profileNameTextEditingController.text= user.profileName;
    bioTextEditingController.text= user.bio;
    setState(() {
      loading = false ;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        key: _scaffoldGlobalKey,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/backgroung1noor.png'),
                  fit: BoxFit.fill,
                )),
            child: loading
                ? CircularProgressIndicator()
                : Column(
              children: <Widget>[
                CustomAppBar(
                    Icons.done,//'assets/images/ic_pen_edit.svg',
                    updateUserData(),
                    'Update profile',
                    'assets/images/ic_back_arrow.svg',
                    backToProfilePage()),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: showEditDialog(),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.black38,
                    backgroundImage:
                    NetworkImage( user.url),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'change profile photo',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      createProfileNameTextFormField(),
                      createBioTextFormField(),
                    ],
                  ),
                ),

              ],
            ),
          ),
        )
      ),
    );
  }

  Column createProfileNameTextFormField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 13.0),
          child: Text(
            "Profile Name",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        TextField(
          style: TextStyle(color: Colors.white),
          controller: profileNameTextEditingController,
          decoration: InputDecoration(
            hintText: "Write profile name here..." ,//user.profileName,
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
            ),
            errorText: _profileNameValid ? null : "profile name is very short ",
          ),
        )
      ],
    );
  }

  Column createBioTextFormField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 13.0),
          child: Text(
            "Bio",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        TextField(
          style: TextStyle(color: Colors.white),
          controller: bioTextEditingController,
          decoration: InputDecoration(
            hintText:"Write Bio here...",// user.bio,
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)
            ),
            errorText: _bioValid ? null : "Bio is too Long ",
          ),
        )
      ],
    );
  }

  updateUserData(){
    //Navigator.pop(context);
    Navigator.of(context).pop();
    profileNameTextEditingController.text.trim().length < 3 || profileNameTextEditingController.text.isEmpty ? _profileNameValid = false : _profileNameValid = true;
    bioTextEditingController.text.trim().length > 110 ?_bioValid = false : _bioValid = true;
    if(_bioValid && _profileNameValid){
      usersReference.document(widget.currentOnlineUserId).updateData({
        "profileName" : profileNameTextEditingController,
        "bio" : bioTextEditingController,
      });
      SnackBar successSnackBar = SnackBar(content: Text("Profile has been updated successfuly"),);
      _scaffoldGlobalKey.currentState.showSnackBar(successSnackBar);
    }
  }
  backToProfilePage(){
    //Navigator.pop(context);
    Navigator.of(context).pop();
  }

  showEditDialog() {}
}
