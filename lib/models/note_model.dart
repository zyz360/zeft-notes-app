import 'package:hive/hive.dart';
part 'note_model.g.dart';


@HiveType(typeId: 0)


class NoteModel extends HiveObject
{
  @HiveField(0)
   String title;
  @HiveField(1)
   String Subtitle;
  @HiveField(2)
  final String Date;
  @HiveField(3)
  final int color;


  NoteModel({required this.title, required this.Subtitle, required this.Date, required this.color});
}