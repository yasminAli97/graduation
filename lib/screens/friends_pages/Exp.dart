/*
import 'package:flutter/material.dart';

class ExpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      color: Colors.amber,
      child: Center(
        child: Text("Exp" , style: TextStyle(color: Colors.black , fontSize: 55.0 ,fontWeight: FontWeight.bold),),
      ),
    );
  }
}

getAllFollowers() async{
  QuerySnapshot querySnapshot = await folowingReference.document(widget.userProfileId)
      .collection("userFollowers").getDocuments();
  setState(() {
   countTotlFollowers = querySnapshot.documents.length;
  });
}

checkIfAreadyFollowing() async{
  DocumentSnapshot documentSnapshot = await followersReference
      .document(widget.userProfile).collection("userFollowers")
      .document(currentOnlineUserId).get();
}

getAllFollowings() async{
  QuerySnapshot querySnapshot = await folowingReference .document(widget.userProfileId)
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
  .setData({});

  followingReference.document(currentOnlineUserId).collection("userFollowing")
  .document(widget.userProfileId)
  .setData({});

  activityFeedReference.document(widget.userProfileId)
      .collection("feedItems").document(currentOnlineUserId)
  .setData({
    "type" : "follow",
    "ownerId": widget.userProfileId,
    "username": currentUser.username,
    "timestamp": DatTime.now(),
    "userProfileImg": currentUser.url,
    "userId": currentOnlineUserId,
  });
}

controlUnFollowUser(){
  setState((){
    following = true;
  });

  followersReference.document(widget.userProfileId).collection("userFollowers")
      .document(currentOnlineUserId)
      .setData({});

  followingReference.document(currentOnlineUserId).collection("userFollowing")
      .document(widget.userProfileId)
      .setData({});

  activityFeedReference.document(widget.userProfileId)
      .collection("feedItems").document(currentOnlineUserId)
      .setData({
    "type" : "follow",
    "ownerId": widget.userProfileId,
    "username": currentUser.username,
    "timestamp": DatTime.now(),
    "userProfileImg": currentUser.url,
    "userId": currentOnlineUserId,
  });
}



*/