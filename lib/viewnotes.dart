import 'package:flutter/material.dart';


class ViewNotesScreen extends StatefulWidget {
  static const routeName = '/ViewNotesScreen';
  @override
  _ViewNotesScreenState createState() => _ViewNotesScreenState();
}

class _ViewNotesScreenState extends State<ViewNotesScreen> {

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF111D49),),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Center(child: Text('View Notes', style: TextStyle(color: Color(0xFF111D49)),),),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(

        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10.0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Text(
                   args.title,
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: Color(0xFF111D49),
                     fontSize: 20.0,
                     fontWeight: FontWeight.w600,
                   ),
                 ),
               ),
                Divider(
                  height: 1.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Container(
                      child: Text(
                        args.description,
                        style: TextStyle(
                          color: Color(0xFF111D49),
                          fontSize: 18.0,
                        ),

                      ),
                    ),
                  ),
                ),],
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String description;

  ScreenArguments({this.title, this.description});
}