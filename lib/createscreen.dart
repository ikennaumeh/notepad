import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'notes_entity.dart';
import 'notes_db.dart';


class CreateScreen extends StatefulWidget {

  final Function addListCallback;
  CreateScreen({this.addListCallback});

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  String newNoteTitle;
  String newNoteDescription;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF111D49),),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Center(child: Text('Add Notes', style: TextStyle(color: Color(0xFF111D49)),),),
        elevation: 0,
        backgroundColor: Colors.white,

        actions: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Colors.blue.shade900,
              child: Text('Save',style: TextStyle(fontSize: 17.0, color: Colors.white),),
              onPressed: ()async{
               widget.addListCallback(newNoteTitle,newNoteDescription);
               Navigator.pop(context);
               final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
               final notesDao = database.notesDao;

               final note = Notes();
               await notesDao.insertNotes(note);

             // final result = await notesDao.findNotesById(1);
              },
            ),
          ),
        ],
      ),
        body: SafeArea(

          child: Padding(
            padding: EdgeInsets.all(10.0,),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(
                      color: Color(0xFF111D49),

                    ),
                  ),
                  onChanged: (newText){
                    newNoteTitle = newText;
                  },
                ),
                Expanded(
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter Note',
                        labelStyle: TextStyle(
                          color: Color(0xFF111D49),
                      ),
                    ),
                      maxLines: 5,
                      onChanged: (newText){
                        newNoteDescription = newText;
                      },
                    ),
                  ),
                ),],
            ),
          ),
        ),
    );
  }
}








