import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectflutterapp/screens/profile/PrfilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:projectflutterapp/screens/first_page.dart';

class ScoreBoard extends StatefulWidget {
  ScoreBoard({Key key}) : super(key: key);

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {

  Future<QuerySnapshot> futurescoresResult ;

  void initState() {
    super.initState();
    controlscores();
  }

  controlscores() {
    Future<QuerySnapshot> allscores = activityFeedReference.document(currentUser.id/*currentUser.id*/)
        .collection("feedItems").orderBy("score", descending: true).limit(50).getDocuments();

    setState(() {
      futurescoresResult = allscores;
    });
  }

  Container displayNoScoresResultScreen(){
    return Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Icon(Icons.group , color: Colors.grey, size: 80.0 ),
              Text(
                "No Friends" ,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white , fontWeight: FontWeight.w500 , fontSize: 30.0),
              ),
            ],
          ),
        )
    );
  }

  displayscoresFoundScreen(){
    return FutureBuilder(
      future: futurescoresResult,
      builder: (context , dataSnapshot){
        if(!dataSnapshot.hasData){
          return CircularProgressIndicator();
        }
        List<ScoreItem> scores = [];
        dataSnapshot.data.documents.forEach((document){
          scores.add(ScoreItem.fromDocument(document));
        });
        return ListView(
              shrinkWrap: true,
              children: scores
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // controlfriends();
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            //height: 50,
            child: Text(
              " SCORE BOARD",//"FRIENDS REQUESTS",
              style: TextStyle(
                  fontFamily: "Segoe UI",
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(bottom:2.0),
            child: Container(
              color: Colors.white54,
              child: ListTile(
                //onTap:  (){},/*=> displayUserProfile(context, userProfileId: currentUser.id),*/
                title:GestureDetector(
                  //onTap: ()=> displayUserProfile(context, userProfileId: userId),
                  child: RichText(
                    overflow:TextOverflow.ellipsis ,
                    text: TextSpan(
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                      children: [
                        TextSpan(text: currentUser.profileName , style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(currentUser.url),
                ),
                trailing: Container(
                  width:100,
                  height: 40,
                  child: Text("score: ${currentUser.score.toString()} " , style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold), ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.purple[900],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width ,
            height: 8,
            decoration: new BoxDecoration(
                color: Colors.purple[900],
                shape: BoxShape.rectangle
            ),
          ),
          futurescoresResult == null ? displayNoScoresResultScreen() : displayscoresFoundScreen(),

        ],
      ),
    );

  }
}

class ScoreItem extends StatelessWidget {

  final String profileName;
  final String url;
  final String userId;
  final int score;

  ScoreItem({this.profileName,this.url,this.userId,this.score,});

  factory ScoreItem.fromDocument(DocumentSnapshot documentSnapshot){
    return ScoreItem(
      profileName: documentSnapshot["profileName"],
      url: documentSnapshot["url"],
      userId: documentSnapshot["userId"],
      score: documentSnapshot["score"],
    );
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(bottom:2.0),
      child: Container(
        color: Colors.white54,
        child: ListTile(
          onTap:  ()=> displayUserProfile(context, userProfileId: userId),
          title:GestureDetector(
            onTap: ()=> displayUserProfile(context, userProfileId: userId),
            child: RichText(
              overflow:TextOverflow.ellipsis ,
              text: TextSpan(
                style: TextStyle(fontSize: 14.0, color: Colors.black),
                children: [
                  TextSpan(text: profileName , style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            backgroundImage: NetworkImage(url),
          ),
          trailing: Container(
            width:100,
            height: 40,
            child: Text("score: $score " , style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold), ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.purple[900],
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
        ),
      ),
    );
  }


  displayUserProfile(BuildContext context , {String userProfileId}){
    Navigator.push(context , MaterialPageRoute(builder: (context) => ProfilePage(userProfileId: userProfileId)));
  }



}
