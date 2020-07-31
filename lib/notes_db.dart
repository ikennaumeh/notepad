import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'notes_entity.dart';
import 'notes_dao.dart';

part 'notes_db.g.dart';

@Database(version: 1, entities: [Notes])
abstract class AppDatabase extends FloorDatabase {
  NotesDao get notesDao;
}

