import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stream/firebase_options.dart';
import 'package:stream/screens/login_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
      // ChatScreen(username: 'moch dhia')
        LoginScreen()
      
    );
  }
}
