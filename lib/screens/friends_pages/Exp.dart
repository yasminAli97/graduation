import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectflutterapp/screens/first_page.dart';
import 'package:projectflutterapp/screens/profile/PrfilePage.dart';
import 'package:timeago/timeago.dart' as tAgo;


class Notifications extends StatefulWidget {
   Notifications({Key key}) : super(key: key);
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  Future<QuerySnapshot> futurefriendsResults ;

  void initState() {
    super.initState();
    controlfriends();
  }

  controlfriends() {
    Future<QuerySnapshot> allfriends = activityFeedReference.document(currentUser.id/*currentUser.id*/)
        .collection("feedItems").orderBy("timestamp", descending: true).limit(50).getDocuments();

    setState(() {
      futurefriendsResults = allfriends;
    });
  }


  Container displayNoSearchResultScreen(){
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

  displayfriendsFoundScreen(){
    return FutureBuilder(
      future: futurefriendsResults,
      builder: (context , dataSnapshot){
        if(!dataSnapshot.hasData){
          return CircularProgressIndicator();
        }
        List<NotificationItem> friends = [];
        dataSnapshot.data.documents.forEach((document){
          friends.add(NotificationItem.fromDocument(document));
        });
        return ListView(
            shrinkWrap: true,
            children: friends );
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
              " NOTIFICATIONS",//"FRIENDS REQUESTS",
              style: TextStyle(
                  fontFamily: "Segoe UI",
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(height: 20),
          futurefriendsResults == null ? displayNoSearchResultScreen() : displayfriendsFoundScreen(),

        ],
      ),
    );

  }


}

Widget mediaPreview ;
String notificationItemText;

class NotificationItem extends StatelessWidget {

  final String profileName;
  final String type;
  final String url;
  final String userId;
  final int score;
  final Timestamp timestamp;

  NotificationItem({this.profileName,this.type,this.url,this.userId,this.score,this.timestamp});

  factory NotificationItem.fromDocument(DocumentSnapshot documentSnapshot){
    return NotificationItem(
      profileName: documentSnapshot["profileName"],
      type: documentSnapshot["type"],
      url: documentSnapshot["url"],
      userId: documentSnapshot["userId"],
      score: documentSnapshot["score"],
      timestamp: documentSnapshot["timestamp"],
    );
  }
  @override
  Widget build(BuildContext context) {

    configuireMediaPreview(context);

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
                  TextSpan(text: "  $notificationItemText"),
                ],
              ),
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            backgroundImage: NetworkImage(url),
          ),
          subtitle: Text(tAgo.format(timestamp.toDate()), overflow: TextOverflow.ellipsis,),
          trailing: mediaPreview,
        ),
      ),
    );
  }


  displayUserProfile(BuildContext context , {String userProfileId}){
    Navigator.push(context , MaterialPageRoute(builder: (context) => ProfilePage(userProfileId: userProfileId)));
  }


  configuireMediaPreview(BuildContext context){
    mediaPreview = Text("");
    if(type == "follow"){
      notificationItemText = "started following you.";
    }
    else {
      notificationItemText ="Error, UnknownType  = $type";
    }
  }
}
