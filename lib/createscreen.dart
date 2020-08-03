import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'notes_entity.dart';
import 'notes_db.dart';
import 'notes_dao.dart';



class CreateScreen extends StatefulWidget {

  final Function addListCallback;
  CreateScreen({this.addListCallback});

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  String newNoteTitle;
  String newNoteDescription;

  NotesDao notesDao;

  void database()async{
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    notesDao = database.notesDao;
  }

  @override
  void initState() {
    database();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color.fromRGBO(216, 221, 240, 1),
              borderRadius: BorderRadius.circular(8)),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Center(child: Text('Add Notes', style: TextStyle(color: Color(0xFF111D49)),),),
        elevation: 0,
        backgroundColor: Colors.white,

        actions: <Widget>[

          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Color.fromRGBO(216, 221, 240, 1),
                borderRadius: BorderRadius.circular(8)),
            child: IconButton(
              icon: Icon(Icons.check),
              onPressed: () async{

                  widget.addListCallback(newNoteTitle,newNoteDescription,DateTime.now().toString());
                  Navigator.pop(context);


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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                color: Color.fromRGBO(216, 221, 240, 1),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          height: 60.0,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          ),
                          child: TextField(
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Title',
                              labelStyle: TextStyle(
                                color: Color(0xFF111D49),
                                fontSize: 25.0,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 8.0)
                            ),
                            onChanged: (newText){
                              newNoteTitle = newText;
                            },
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          child: Container(

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Enter Note',
                                labelStyle: TextStyle(
                                  color: Color(0xFF111D49),
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w400,
                              ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 8.0),
                            ),
                              maxLines: 2,

                              onChanged: (newText){
                                newNoteDescription = newText;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),],
                ),
              ),
            ),
          ),
        ),
    );
  }
}








