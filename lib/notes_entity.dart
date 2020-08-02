import 'package:floor/floor.dart';

@Entity(tableName: 'notes')
class Notes {
  @PrimaryKey(autoGenerate: true)
  final int id;

  @ColumnInfo(name: 'custom_name', nullable: false)
  final String title;
  final String description;
  final String date;

  Notes({this.id,this.title, this.description, this.date});
}