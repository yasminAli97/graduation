import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectflutterapp/models/User.dart';
import '../ProfilePage.dart';
import '../first_page.dart';


//final usersReference = Firestore.instance.collection("users");

class SearchPage extends StatefulWidget {

  //SearchPage({Key key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with AutomaticKeepAliveClientMixin<SearchPage> {

  TextEditingController searchTextEditingController = TextEditingController();
  Future<QuerySnapshot> futureSearchResults ;

  emptyTextFormField(){
    searchTextEditingController.clear();
    setState(() {
      futureSearchResults = null;
    });
  }

  controlSearching(String str) {
    Future<QuerySnapshot> allUsers = usersReference.where("profileName",isGreaterThanOrEqualTo: str).getDocuments();
    setState(() {
      futureSearchResults = allUsers;
    });
  }

  /*AppBar searchPageHeader(){
    return AppBar(
      backgroundColor: Colors.amber,
      title: TextFormField(
        style: TextStyle(fontSize: 18.0 , color: Colors.white),
        controller: searchTextEditingController,
        decoration: InputDecoration(
            hintText: "Search here....",
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            prefixIcon: Icon(Icons.person_pin , color: Colors.white, size: 30.0,),
            suffixIcon: IconButton(icon: Icon(Icons.clear , color: Colors.white,), onPressed: emptyTextFormField)
        ),
        onFieldSubmitted: controlSearching,
      ),
    );
  }*/

  Container displayNoSearchResultScreen(){
    return Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Icon(Icons.group , color: Colors.grey, size: 80.0 ),
              Text(
                "Search \n Users" ,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white , fontWeight: FontWeight.w500 , fontSize: 30.0),
              ),
              /*Image.network(
              'https://picsum.photos/250?image=9',
            ),*/
            ],
          ),
        )
    );
  }

  displayUsersFoundScreen(){
    return FutureBuilder(
      future: futureSearchResults,
      builder: (context , dataSnapshot){
        if(!dataSnapshot.hasData){
          return CircularProgressIndicator();
        }
        List<UserResult> searchUserResult = [];
        dataSnapshot.data.documents.forEach((document){
          User eachUser = User.fromDocument(document);
          UserResult userResult = UserResult(eachUser);//error:'package:flutter/src/painting/_network_image_io.dart': Failed assertion: line 23 pos 14: 'url != null': is not true.
          searchUserResult.add(userResult);
        });
        return ListView(
            shrinkWrap: true,
            children: searchUserResult );
      },
    );
  }

  bool get wantKeepAlive => true ;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          /*Container(
            child: Text(
              "Search",
              style: TextStyle(
                  fontFamily: "Segoe UI",
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),*/
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
            child:TextFormField(
              //style: TextStyle(fontSize: 18.0 , color: Colors.white),
              controller: searchTextEditingController,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Color(0xFFD5D5D5),
              ),
              cursorColor: Color(0xFFD5D5D5),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_pin , color: Colors.white, size: 30.0,),
                suffixIcon: IconButton(icon: Icon(Icons.clear , color: Colors.white,), onPressed: emptyTextFormField),
                hintText: "Search here...",
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
              onFieldSubmitted: controlSearching,
            ),
          ),
          SizedBox(height: 20),
          futureSearchResults == null ? displayNoSearchResultScreen() : displayUsersFoundScreen(),

        ],
      ),
    );

  }
}


///------------------------

class UserResult extends StatelessWidget {

  final User eachUser;
  UserResult(this.eachUser);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.0),
      child: Container(
        color: Colors.white54,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: ()=> "tapped",/*displayUserProfile(context , userProfileId:eachUser.id */ /*getCurrentOnlineUser()),*/
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage:NetworkImage(eachUser.url),
                  //child: Image.network(eachUser.url ),//not error
                  /*backgroundImage: CachedNetworkImageProvider(eachUser.url)*//*Image.network(eachUser.url ),*///error code
                ),
                title: Text(
                  eachUser.profileName ,
                  style: TextStyle(
                      color: Colors.black , fontSize: 16.0 , fontWeight: FontWeight.bold
                  ),),
                subtitle: Text(
                  eachUser.username ,
                  style: TextStyle( color: Colors.black, fontSize: 13.0 ,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*displayUserProfile(BuildContext context , {String userProfileId}){
    Navigator.push(context , MaterialPageRoute(builder: (context) => ProfilePage(userProfileId: userProfileId)));
  }*/
}
