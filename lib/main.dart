import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectflutterapp/screens/addTaskScreen.dart';
import 'package:projectflutterapp/screens/categoriesScreen.dart';
import 'package:projectflutterapp/screens/categoryDetailsScreen.dart';
import 'package:projectflutterapp/screens/home_screen.dart';
import 'package:projectflutterapp/screens/task_attribute.dart';
import 'package:projectflutterapp/screens/friends.dart';
import 'package:projectflutterapp/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:projectflutterapp/services/auth.dart';
import 'package:projectflutterapp/models/User.dart';
import 'constants/constants.dart';
import 'package:projectflutterapp/screens/first_page.dart';
import 'package:projectflutterapp/screens/ProfilePage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';
import 'package:rxdart/subjects.dart';

class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });
}
final BehaviorSubject<ReceivedNotification>
didReceiveLocalNotificationSubject =
BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
BehaviorSubject<String>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  NotificationAppLaunchDetails notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();



  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  // Note: permissions aren't requested here just to demonstrate that can be done later using the `requestPermissions()` method
  // of the `IOSFlutterLocalNotificationsPlugin` class
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {
        didReceiveLocalNotificationSubject.add(ReceivedNotification(
            id: id, title: title, body: body, payload: payload));
      });
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    selectNotificationSubject.add(payload);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Graduation Project',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          dialogBackgroundColor: Colors.white,
          primarySwatch: Colors.purple,
          cardColor: Colors.white70,
          accentColor: Colors.purple,
        ),
        home: FirstPage(),
        //MyWidget(),
        routes: <String, WidgetBuilder>{
          HOME_SCREEN: (BuildContext context) => HomeScreen(),
          ADD_NEW_TASK: (BuildContext context) => AddNewTaskScreen(),
          CATEGORIES_SCREEN: (BuildContext context) => CategoriesScreen(),
        });
  }
}
