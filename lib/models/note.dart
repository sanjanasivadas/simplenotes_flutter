import 'package:isar/isar.dart';

//this line is needed to generate file 
//then run: flutter pub run build_runner build
part 'note.g.dart';

@Collection()
class Note{
  Id id = Isar.autoIncrement; //starts to create new notes from 0
  late String text;   //text in the notes
}