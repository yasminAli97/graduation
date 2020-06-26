import 'package:flutter/material.dart';


class Friends extends StatefulWidget {

  // Friends({Key key}) : super(key: key);

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {

  static TextEditingController _searchFriendQuery = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              "FRIENDS",
              style: TextStyle(
                  fontFamily: "Segoe UI",
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 20),
          /*TextField(
            controller: _searchFriendQuery,
            textAlign: TextAlign.start,
            style: new TextStyle(
              color: Color(0xFFD5D5D5),
            ),
            cursorColor: Color(0xFFD5D5D5),
            decoration: InputDecoration(
              //   border: InputBorder(),
              hintText: "Search",
              hintStyle: TextStyle(
                fontFamily: "segoepr",
                fontSize: 12,
                color: Color(0xFFD5D5D5),
              ),

              prefix: Icon(Icons.search,
                  color: Color(0xFFD5D5D5)),
              filled: true,
              fillColor: Colors.transparent,
              enabledBorder: UnderlineInputBorder(
                borderSide:
                BorderSide(color: Colors.transparent),
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.transparent),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30),
                ),
              ),
            ),
          ),*///error code for search box ,the true is below
          Container(
            //width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 30, right: 30),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                  color: Color(0xFFD5D5D5), width: 1.5),
            ),
            child:  Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 5),
                  child: Icon(Icons.search , color: Color(0xFFD5D5D5)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35,top: 16),
                  child: TextField(
                    controller: _searchFriendQuery,
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                      color: Color(0xFFD5D5D5),
                    ),
                    cursorColor: Color(0xFFD5D5D5),
                    decoration: InputDecoration(
                      //   border: InputBorder(),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        fontFamily: "segoepr",
                        fontSize: 12,
                        color: Color(0xFFD5D5D5),
                      ),

                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.transparent),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.transparent),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
