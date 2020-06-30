//import 'package:firebase_database/firebase_database.dart';
import 'package:projectflutterapp/models/Category.dart';
import 'package:projectflutterapp/models/Task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  // final String uid;

  // User({this.uid});

  final String id;
  final String profileName;
  final String username;
  final String url;
  final String email;
  final String bio;
  final int score;

  User({
    this.id,
    this.profileName,
    this.username,
    this.url,
    this.email,
    this.bio,
    this.score
  });


  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
        id: doc.documentID,
        email: doc['email'],
        username: doc['username'],
        url: doc['url'],
        profileName: doc['profileName'],
        bio: doc['bio'],
        score: doc["score"]

    );
  }

}