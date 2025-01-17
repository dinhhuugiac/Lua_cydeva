import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:lua_v2_cydeva/firebase_options.dart';
import 'package:lua_v2_cydeva/screens/login_pages/login_page.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
