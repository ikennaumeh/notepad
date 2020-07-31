import 'package:floor/floor.dart';
import 'notes_entity.dart';
import 'dart:async';


@dao
abstract class NotesDao {
  @Query('SELECT * FROM Notes')
  Future<List<Notes>> findAllNotes();

  @Query('SELECT * FROM Notes WHERE id = :id')
  Stream<Notes> findNotesById(int id);

  @insert
  Future<void> insertNotes(Notes notes);

  @update
  Future<int> updateNotes(Notes notes);

  @delete
  Future<int> deleteNotes(Notes notes);

}

