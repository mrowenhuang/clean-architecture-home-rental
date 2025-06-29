import 'package:clean_architecture_rental_room/core/theme/app_theme.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/pages/switch_page.dart';
import 'package:clean_architecture_rental_room/features/rental/presentation/pages/home_page.dart';
import 'package:clean_architecture_rental_room/firebase_options.dart';
import 'package:clean_architecture_rental_room/injection.dart';
import 'package:clean_architecture_rental_room/test_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>()..add(InitialAuthEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Home Rental App',
        theme: AppTheme.appTheme(context),
        home: TestPage(),
      ),
    );
  }
}
