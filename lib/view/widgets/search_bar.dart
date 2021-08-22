import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(
        top: deviceHeight * 0.025,
        left: deviceWidth * 0.05,
        right: deviceWidth * 0.05,
      ),
      child: Container(
        width: deviceWidth * 0.9,
        height: deviceHeight * 0.075,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 25,
              spreadRadius: -10,
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            Expanded(
              flex: 5,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintText: 'Tarif arayın',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
