import 'package:clean_architecture_rental_room/core/theme/apptheme.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/pages/switch_page.dart';
import 'package:clean_architecture_rental_room/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Apptheme.appTheme(context),
      home: const SwitchPage()
    );
  }
}
