/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'CustomAppBar.dart';
import 'CustomTextField.dart';

class CustomText extends StatelessWidget {
  CustomText(this.text, this.customColor);

  String text;
  Color customColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          color: customColor,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

class CustomColumnText extends StatelessWidget {

  CustomColumnText(this.text0, this.text, this.customColor);

  String text0;
  String text;
  Color customColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomText(text0,customColor),
        CustomText(text,customColor),
      ],
    );
  }
}


class ShowProfile2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Path_1833.png'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 15.0,
                            offset: Offset(0.0, 0.75))
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        CustomAppBar('assets/images/ic_pen_edit.svg', 'Profile',
                            'assets/images/ic_back_arrow.svg',null),
                        SizedBox(
                          height: 35,
                        ),
                        CustomColumnText('Eman', 'Ammm ODOD', Color(0xFF9966FF))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CustomColumnText('10', 'Friends', Color(0xFF9966FF)),
                          CustomColumnText('15', 'Task', Color(0xFF9966FF)),
                          CustomColumnText('60', 'Score', Color(0xFF9966FF)),
                        ],
                      ),
                      TextFieldItem(ImageIcon(AssetImage('assets/images/ic_mail.png'),color: Color(0xFF9966FF)), '', 'FayzaElzain@gmail.com'),
                      TextFieldItem.addSecondIcon(ImageIcon(AssetImage('assets/images/ic_lock.png'),color: Color(0xFF9966FF),), '', '123456789',ImageIcon(AssetImage('assets/images/ic_seen.png'),color: Color(0xFF9966FF))),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 2 / 5 - 60,
              left: MediaQuery.of(context).size.width / 2 - 60,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.people,
                  size: 60,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}*/

