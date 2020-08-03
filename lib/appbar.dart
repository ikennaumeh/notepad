import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    leading: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Color.fromRGBO(216, 221, 240, 1),
            borderRadius: BorderRadius.circular(8)),
        child: Icon(
          Icons.menu,
          color: Color(0xFF111D49),
        )),
    title: Center(child: Text('MyNotes',style: TextStyle(color: Color(0xFF111D49),fontSize: 23.0),)),
    actions: <Widget>[

      Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color.fromRGBO(216, 221, 240, 1),
              borderRadius: BorderRadius.circular(8)),
          child: Icon(
            Icons.search,
            color: Color(0xFF111D49),
          )),
    ],
    elevation: 0,
    backgroundColor: Colors.white,
  );
}