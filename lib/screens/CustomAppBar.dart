import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer(this.bottomLift, this.bottomRight);

  double bottomLift;
  double bottomRight;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: new BoxDecoration(
        color: Color(0xFF9966FF),
        shape: BoxShape.rectangle,
        // border: Border.all(color: Colors.black87, width: 1.0),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(bottomRight),
            bottomLeft: Radius.circular(bottomLift),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black54,
              blurRadius: 15.0,
              offset: Offset(0.0, 0.75))
        ],
      ),
    );

  }
}

class CustomAppBar extends StatelessWidget {
  CustomAppBar(this.rightAsset,this.rightFunction, this.title, this.leftAsset,this.leftFunction /*this.customRoute*/);

  IconData rightAsset;//String rightAsset;
  Function rightFunction;
  String title;
  String leftAsset;
  Function leftFunction;

  //Route<Object> customRoute;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: GestureDetector(
              onTap:leftFunction(),
              /*() {
                Navigator.of(context).pop();
              },*/
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  CustomContainer(0, 50),
                  SvgPicture.asset(
                    leftAsset,
                    color: Colors.white,
                    height: 35,
                  ),
                ],
              )),
        ),
        Expanded(
          flex: 3,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: GestureDetector(
                onTap: rightFunction(),/*() {
                  Navigator.push(context, customRoute);
                },*/
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CustomContainer(50, 0),
                    /*SvgPicture.asset(
                      rightAsset,
                      color: Colors.white,
                      height: 35,
                    ),*/
                    IconButton(
                      icon: Icon(
                        rightAsset,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ],
                )))
      ],
    );
  }
}