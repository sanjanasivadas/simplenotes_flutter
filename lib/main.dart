import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplenotes_flutter/models/note_database.dart';

import 'pages/notes_page.dart';

void main() async{
  //initialize note isar database
  WidgetsFlutterBinding.ensureInitialized();
   await NoteDatabase.initialize();

  runApp(ChangeNotifierProvider(
     create: (context) => NoteDatabase(),
     child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
    );
  }
}

