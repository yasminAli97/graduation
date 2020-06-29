import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldItem extends StatelessWidget {
  TextFieldItem(this.iconA, this.label, this.hint);
  TextFieldItem.addSecondIcon(this.iconA, this.label, this.hint, this.iconB, [this.tec]);

  Widget iconA;
  String label;
  String hint;
  Widget iconB;
  TextEditingController tec;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: Text(
              label,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0, left: 16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: iconA,
                hintText: hint,
                suffixIcon: iconB,
              ),
              controller: tec,
            ),
          ),
        ],
      ),
    );
  }
}