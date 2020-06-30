import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectflutterapp/models/Category.dart';
import 'package:projectflutterapp/models/Task.dart';
import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:projectflutterapp/utility/MyImage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectflutterapp/utility/sql_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

final dbHelper = SQL_Helper();
DateTime date = DateTime.now();
Task task = Task.withDefautCat(1, 0, date.toIso8601String());

class AddNewTaskScreen extends StatefulWidget {
  AddNewTaskScreen({Key key}) : super(key: key);

  @override
  _AddNewTaskScreen createState() => _AddNewTaskScreen();
}

class _AddNewTaskScreen extends State<AddNewTaskScreen> {
  File imageFile = null;
  String imageToSave = "";
  String imgString = "";

  TextEditingController controller = TextEditingController();

  List<String> timeInterval = ["Daily", "Weekly", "Monthly", "Never"];
  List<bool> isPressTime = [false, false, false, false];
  List<Task> tasks = List<Task>();

  List<String> colorsBlankImages = [
    "assets/images/ic_redd.svg",
    "assets/images/ic_bluee.svg",
    "assets/images/ic_greenn.svg",
    "assets/images/ic_yelloww.svg"
  ];

  bool isChecked = true;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isDetectTime = false;

   MaterialLocalizations localizations;
   String formattedTimeOfDay;

  @override
  Widget build(BuildContext context) {
    localizations = MaterialLocalizations.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: null,
        backgroundColor: Color(0xff9966FF),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bgwithout.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 1.6 / 4,
                              height: 75,
                              decoration: new BoxDecoration(
                                color: Color(0xffA57DF4),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(0),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffBBB4C9).withOpacity(.35),
                                    blurRadius: 15.0,
                                    offset: const Offset(0.0, 10.0),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      1.2 /
                                      4,
                                  height: 50,
                                  decoration: new BoxDecoration(
                                    color: Color(0xffAB85F6),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(30)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      SvgPicture.asset(
                                          "assets/images/ic_back_arrow.svg"),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 1.4 / 4,
                          height: 75,
                          decoration: new BoxDecoration(
                            color: Color(0xffBCAAE0).withOpacity(.35),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(0),
                                bottomLeft: Radius.circular(50),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0)),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                addTask(task);
                              });
                            },
                            child: Container(
                              width:
                                  MediaQuery.of(context).size.width * 1.6 / 4,
                              height: 80,
                              decoration: new BoxDecoration(
                                color: Color(0xffBCAAE0).withOpacity(.35),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(50),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  SvgPicture.asset(
                                      "assets/images/ic_check_btn.svg"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        alignment: AlignmentDirectional.topCenter,
                        child: Text(
                          "Add new task",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "segoepr",
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 3.5 / 5,
                          margin: EdgeInsets.only(left: 20),
                          child: TextField(
                            onSubmitted: (text) {
                              setState(() {
                                task.title = text;
                              });
                            },
                            controller: controller,
                            cursorColor: Color(0xFFFFCC00),
                            textAlignVertical: TextAlignVertical.bottom,
                            style: TextStyle(
                                color: Color(0xFFE2DDC7),
                                fontFamily: "Segoe UI",
                                fontSize: 15),
                            decoration: InputDecoration(
                              filled: false,
                              hintText: "What should be done?",
                              suffixIcon: Icon(Icons.mic, color: Colors.white),
                              hintStyle: TextStyle(
                                  color: Color(0xFFE2DDC7),
                                  fontFamily: "Segoe UI",
                                  fontSize: 15),

                              //       border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width * 3 / 4,
                            margin: EdgeInsets.only(left: 20),
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              "Add to the list : ",
                              style: TextStyle(
                                  fontFamily: "Segoe UI",
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                          //  alignment: AlignmentDirectional.topStart,
                          child: SvgPicture.asset(
                            "assets/images/ic_addtolist.svg",
                            width: 17,
                            height: 17,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 90,
                      child: FutureBuilder<List<Category>>(
                          future: dbHelper.showCategories(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Category>> asyncSnapshot) {
                            if (asyncSnapshot.data == null) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: asyncSnapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return getCategories(
                                        asyncSnapshot.data[index]);
                                  });
                            }
                          }),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 20),
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              "Time Interval : ",
                              style: TextStyle(
                                  fontFamily: "Segoe UI",
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    timeIntervalWidget(),
                    Row(
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width / 2,
                            margin: EdgeInsets.only(left: 20),
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              "Choose Image ",
                              style: TextStyle(
                                  fontFamily: "Segoe UI",
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: SvgPicture.asset(
                              "assets/images/ic_imagepicker.svg"),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width / 2,
                            margin: EdgeInsets.only(left: 20),
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              "Reminder",
                              style: TextStyle(
                                  fontFamily: "Segoe UI",
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                              task.addAlert = isChecked;
                            });
                          },
                          child: CustomSwitchButton(
                            buttonWidth: 45,
                            buttonHeight: 25,
                            indicatorWidth: 18,
                            backgroundColor: Colors.white,
                            unCheckedColor: Color(0xffFE5F5F),
                            animationDuration: Duration(milliseconds: 400),
                            checkedColor: Color(0xffFE5F5F),
                            checked: isChecked,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width / 2,
                            margin: EdgeInsets.only(left: 20),
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              "Share With Friends",
                              style: TextStyle(
                                  fontFamily: "Segoe UI",
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(width: 25),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                              "assets/images/ic_share_friends.svg"),
                        )
                      ],
                    ),
                    isDetectTime
                        ? detectedTimeContainer(context)
                        : GestureDetector(
                            onTap: () {
                              _selectDate(context);
                              setState(() {
                                isDetectTime = true;
                              });
                            },
                            child: Container(
                              alignment: AlignmentDirectional.bottomCenter,
                              child: SvgPicture.asset("assets/images/time.svg"),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: new DateTime.now().subtract(new Duration(days: 30)),
      lastDate: new DateTime.now().add(new Duration(days: 30)),
    );
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _selectTime(context);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked_s != null)
      setState(() {
        selectedTime = picked_s;
      });
  }

  Widget detectedTimeContainer(BuildContext context) {
    return Container(
      width: 120,
      height: 100,
      margin: EdgeInsetsDirectional.only(top: 20),
      padding: EdgeInsetsDirectional.only(start: 10, end: 10),
      alignment: AlignmentDirectional.topStart,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              _selectDate(context);
              task.time=  DateFormat('EEE,dd MMMM').format(selectedDate);
            },
            child: Container(
              width: 110,
              padding: EdgeInsetsDirectional.only(
                  start: 5, end: 5, top: 7, bottom: 7),
              decoration: BoxDecoration(
                  color: Color(0xffDAD0EE),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                DateFormat('EEE,dd MMMM').format(selectedDate),
                style: TextStyle(
                    color: Color(0xff605995), fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              _selectTime(context);

            },
            child: Container(
              alignment: AlignmentDirectional.center,
                width: 110,
                padding: EdgeInsetsDirectional.only(
                    start: 5, end: 5, top: 7, bottom: 7),
                decoration: BoxDecoration(
                    color: Color(0xffDAD0EE),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
//                  selectedTime.hour.toString() +
//                      ":" +
//                      selectedTime.minute.toString(),
                  localizations.formatTimeOfDay(selectedTime),
                  style: TextStyle(
                      color: Color(0xff605995), fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }

  Future getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = image;
      imageToSave = MyImage.base64String(imageFile.readAsBytesSync());
      //  imageFile = MyImage.dataFromBase64String(imageToSave);
      tasks[0].image = imageToSave;

      print('Select image path' + imageFile.path.toString());
    });
  }

  Widget timeIntervalWidget() {
    return Container(
      height: 90,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: timeInterval.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  isPressTime[index] = !isPressTime[index];
                  if (isPressTime[index]) {
                    isPressTime = [false, false, false, false];
                    isPressTime[index] = true;
                    task.timeInterval = timeInterval[index];
                  }
                });
              },
              child: Wrap(
                children: <Widget>[
                  isPressTime[index]
                      ? Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            Container(
                                child: SvgPicture.asset(
                                    colorsBlankImages[index % 5])),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Icon(
                                CupertinoIcons.check_mark,
                                color: Colors.white,
                                size: 35,
                              ),
                            )
                          ],
                        )
                      : Container(
                          child: SvgPicture.asset(colorsBlankImages[index % 5]),
                        ),
                  Container(
                    margin: EdgeInsets.only(top: 15, right: 5),
                    child: Text(
                      timeInterval[index],
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Rubik",
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  void addTask(Task task) async {
    int result = await dbHelper.insertTask(task);

    if (result == 0) {
      Fluttertoast.showToast(
          msg: "Task not saved",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Navigator.of(context).pop();
      Fluttertoast.showToast(
          msg: "Task has been saved successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }
}

class getCategories extends StatefulWidget {
  Category category;

  getCategories(this.category);

  @override
  _getCategories createState() => _getCategories(category);
}

class _getCategories extends State<getCategories> {
  Category category;

  _getCategories(this.category);

  List<String> colorsImages = [
    "assets/images/ic_red.svg",
    "assets/images/ic_blue.svg",
    "assets/images/ic_green.svg",
    "assets/images/ic_yellow.svg",
    "assets/images/ic_orange.svg"
  ];
  List<Color> colors = [
    Color(0xffFE5F5F),
    Color(0xff25B0FF),
    Color(0xff7DE82B),
    Color(0xffFFCC00),
    Color(0xffF29130),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          category.isPress = !category.isPress;
          task.categoryId = category.id;
        });
      },
      child: Wrap(
        children: <Widget>[
          category.isPress
              ? Wrap(
                  children: <Widget>[
                    Container(
                      child: SvgPicture.asset(
                        colorsImages[category.id % 5],
                        color: Colors.transparent,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      padding:
                          EdgeInsets.only(left: 7, right: 7, top: 3, bottom: 3),
                      decoration: new BoxDecoration(
                        color: colors[category.id % 5],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: [
                          BoxShadow(
                            color: colors[category.id % 5],
                            blurRadius: 7.0,
                            offset: const Offset(0.0, 3.0),
                          ),
                        ],
                      ),
                      child: Text(
                        category.title,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Rubik",
                            color: Colors.white),
                      ),
                    ),
                  ],
                )
              : Wrap(
                  children: <Widget>[
                    Container(
                      child: SvgPicture.asset(colorsImages[category.id % 5]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      padding:
                          EdgeInsets.only(left: 7, right: 7, top: 3, bottom: 3),
                      decoration: new BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.transparent,
                            blurRadius: 7.0,
                            offset: const Offset(0.0, 3.0),
                          ),
                        ],
                      ),
                      child: Text(
                        category.title,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Rubik",
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
