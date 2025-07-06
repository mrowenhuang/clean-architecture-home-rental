import 'package:clean_architecture_rental_room/core/theme/app_theme.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/pages/signup_page.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/pages/switch_page.dart';
import 'package:clean_architecture_rental_room/features/rental/presentation/pages/home_page.dart';
import 'package:clean_architecture_rental_room/firebase_options.dart';
import 'package:clean_architecture_rental_room/injection.dart';
import 'package:clean_architecture_rental_room/test_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
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
        BlocProvider(create: (context) => sl<LoginBloc>()),
        BlocProvider(create: (context) => sl<RegisterBloc>()),
      ],
      child: MaterialApp(
        title: 'Home Rental App',
        theme: AppTheme.appTheme(context),
        home: SwitchPage(),
      ),
    );
  }
}
