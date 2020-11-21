import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Padding(
        padding: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                width: 0,
                color: Color(0xFFfb3132),
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xFFfb3132),
            ),
            fillColor: Color(0xFFFAFAFA),
            hintStyle: new TextStyle(color: Color(0xFFd0cece), fontSize: 18),
            hintText: "What would your like to buy?",
          ),
        ),
      ),
    );
  }
}
