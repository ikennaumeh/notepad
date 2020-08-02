// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NotesDao _notesDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `notes` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `custom_name` TEXT NOT NULL, `description` TEXT, `date` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NotesDao get notesDao {
    return _notesDaoInstance ??= _$NotesDao(database, changeListener);
  }
}

class _$NotesDao extends NotesDao {
  _$NotesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _notesInsertionAdapter = InsertionAdapter(
            database,
            'notes',
            (Notes item) => <String, dynamic>{
                  'id': item.id,
                  'custom_name': item.title,
                  'description': item.description,
                  'date': item.date
                },
            changeListener),
        _notesUpdateAdapter = UpdateAdapter(
            database,
            'notes',
            ['id'],
            (Notes item) => <String, dynamic>{
                  'id': item.id,
                  'custom_name': item.title,
                  'description': item.description,
                  'date': item.date
                },
            changeListener),
        _notesDeletionAdapter = DeletionAdapter(
            database,
            'notes',
            ['id'],
            (Notes item) => <String, dynamic>{
                  'id': item.id,
                  'custom_name': item.title,
                  'description': item.description,
                  'date': item.date
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _notesMapper = (Map<String, dynamic> row) => Notes(
      id: row['id'] as int,
      title: row['custom_name'] as String,
      description: row['description'] as String,
      date: row['date'] as String);

  final InsertionAdapter<Notes> _notesInsertionAdapter;

  final UpdateAdapter<Notes> _notesUpdateAdapter;

  final DeletionAdapter<Notes> _notesDeletionAdapter;

  @override
  Future<List<Notes>> findAllNotes() async {
    return _queryAdapter.queryList('SELECT * FROM Notes', mapper: _notesMapper);
  }

  @override
  Stream<Notes> findNotesById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Notes WHERE id = ?',
        arguments: <dynamic>[id],
        queryableName: 'notes',
        isView: false,
        mapper: _notesMapper);
  }

  @override
  Future<void> insertNotes(Notes notes) async {
    await _notesInsertionAdapter.insert(notes, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateNotes(Notes notes) {
    return _notesUpdateAdapter.updateAndReturnChangedRows(
        notes, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteNotes(Notes notes) {
    return _notesDeletionAdapter.deleteAndReturnChangedRows(notes);
  }
}
