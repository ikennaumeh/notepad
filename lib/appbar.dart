import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Center(child: Text('MyNotes',style: TextStyle(color: Color(0xFF111D49),fontSize: 23.0),)),
    actions: <Widget>[

      IconButton(
        color: Color(0xFF7C84A3),
        icon: Icon(Icons.search,color:Color(0xFF111D49),),
        onPressed: null,
        iconSize: 30,
      )],
    elevation: 0,
    backgroundColor: Colors.white,
  );
}