import 'package:isar/isar.dart';
import 'package:simplenotes_flutter/models/note.dart';
import 'package:path_provider/path_provider.dart';


class NoteDatabase {
  static late Isar isar;

  //INITIALIZE - DATABASE
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }
 
 //list of notes
  final  List<Note> currentNotes = [];

 //CREATE - A note and save to db
  Future<void> addNote(String textFromUser) async{

    //create a new note object
    final newNote = Note()..text = textFromUser;

    //save to database
    await isar.writeTxn(() => isar.notes.put(newNote));

    // re-read from database
    fetchNotes();
  }

 //READ - Notes from db
 Future<void> fetchNotes() async {
   List<Note> fetchedNotes = await isar.notes.where().findAll();
  currentNotes.clear();
  currentNotes.addAll(fetchedNotes);
 }

 //UPDATE - A Note in db


 //DELETE - A Note from db 


}