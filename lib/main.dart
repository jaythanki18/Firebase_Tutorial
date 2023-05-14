import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartclass/screens/nav_screen.dart';
import 'package:smartclass/ui/firestore/firestore_list_screen.dart';
import 'package:smartclass/ui/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: FireStoreScreen(),
    );
  }
}


