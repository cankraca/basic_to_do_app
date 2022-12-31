import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'views/my_home_page.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do App',
      theme: ThemeData(
        listTileTheme: ListTileThemeData(
          tileColor: Colors.yellow,
        ),
        scaffoldBackgroundColor: Colors.yellow[200],
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
    );
  }
}
