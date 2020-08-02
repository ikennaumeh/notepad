import 'package:flutter/material.dart';
import 'createscreen.dart';
import 'viewnotes.dart';
import 'appbar.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyNotes',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        
        ViewNotesScreen.routeName:(context) => ViewNotesScreen(),
      }


    );
  }
}

class MyHomePage extends StatefulWidget {


   @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  List<Notes> noteList = [
//    Notes(title: 'New Music', description: 'Cant get enough of you'),
//    Notes(title: 'Poster Boy', description: 'Ferrari poster boy'),
//    Notes(title: 'Kinging with Kobe', description: 'King kobe came to town to...'),
//    Notes(title: 'Aces', description: 'Bust thru of Ikenna U...'),
  ];


   @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: noteList != null ? buildList(context) : Center(child: Text('Write Notes',style: TextStyle(fontSize: 40.0),),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF111D49),
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateScreen(addListCallback: (newNotesTitle, newNoteDescription,){
                noteList.add((Notes(title: newNotesTitle, description: newNoteDescription)));
          })));
        },

        child: Icon(Icons.add),
      ),
    );
  }


  Padding buildList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0,),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height-116,
            width: double.infinity,
            child: ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(noteList[index].title,
                    style: TextStyle(
                      color: Color(0xFF111D49),
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,),
                  ),
                  subtitle: Text(noteList[index].description),
                  trailing:Container(
                    width: 50.0,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.star_border,
                        ),
                        Icon(
                          Icons.more_vert,

                          color: Color(0xFF111D49),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, ViewNotesScreen.routeName,arguments: ScreenArguments(title: noteList[index].title, description: noteList[index].description, ));
                  },

                );
              },

            ),
          ),
        ],
      ),
    );
  }


}

class Notes{
  final String title;
  final String description;

  Notes({this.title, this.description});
}