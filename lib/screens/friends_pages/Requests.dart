import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectflutterapp/screens/first_page.dart';
import 'package:projectflutterapp/screens/profile/PrfilePage.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          FutureBuilder(
            future: retrieveNotifications(),
          ),
        ],
      ),
    );
  }

  retrieveNotifications() async{
    QuerySnapshot querySnapshot = await activityFeedReference.document(currentUser.id)
        .collection("feedItems").orderBy("timestamp", descending: true).limit(50).getDocuments();

    List<NotificationItem> notificationsItems = [];

    querySnapshot.documents.forEach((document) {
      notificationsItems.add(NotificationItem.fromDocument(document));
    });
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
    return Padding(
      padding: EdgeInsets.only(bottom:2.0),
      child: Container(
        color: Colors.white54,
        child: ListTile(
          title:GestureDetector(
            onTap: ()=> displayUserProfile(context, userProfileId: userId),
            child: RichText(
              overflow:TextOverflow.ellipsis ,
              text: TextSpan(
                style: TextStyle(fontSize: 14.0, color: Colors.black),
                children: [
                  TextSpan(text: profileName , style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "$notificationItemText")
                ],
              ),
            ),
          ),
          leading: CircleAvatar(),
        ),
      ),
    );
  }
  displayUserProfile(BuildContext context , {String userProfileId}){
    Navigator.push(context , MaterialPageRoute(builder: (context) => ProfilePage(userProfileId: userProfileId)));
  }
}
