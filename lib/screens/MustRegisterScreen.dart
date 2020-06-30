import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectflutterapp/screens/first_page.dart';

class MustRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.topStart,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 1.4 / 4,
                  height: 80,
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
                      width: MediaQuery.of(context).size.width * 1.1 / 4,
                      height: 50,
                      decoration: new BoxDecoration(
                        color: Color(0xffAB85F6),
                        shape: BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(30)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SvgPicture.asset("assets/images/ic_back_arrow.svg"),
                        ],
                      )),
                ),
              ],
            ),
          ),
          SizedBox(height: 200),
          Container(
            alignment: AlignmentDirectional.center,
            child: Text(
              "Sorry; You should Sign up",
              style: TextStyle(
                fontFamily: "Segoe UI",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ),
          SizedBox(height: 20),
          RaisedButton(
            color: Colors.purple,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FirstPage();
                // return MyWidget();
              }));
            }, child: Text(
            "Sign up",
            style: TextStyle(
              fontFamily: "Segoe UI",
              fontSize: 20,

              color: Colors.white,
            ),
          ),
          )
        ],
      ),
    )));
  }
}
