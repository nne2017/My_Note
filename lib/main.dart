import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_note_app/constants.dart';
import 'package:my_note_app/models/note_model.dart';
import 'package:my_note_app/simple_bloc_observer.dart';
import 'package:my_note_app/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(
    const MyNotesApp(),
  );
}

class MyNotesApp extends StatelessWidget {
  const MyNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            "assets/images/myNote.png",
            fit: BoxFit.fill,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      splashIconSize: 450,
      duration: 2500,
      nextScreen: const NotesView(),
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
