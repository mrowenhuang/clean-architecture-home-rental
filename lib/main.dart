import 'package:clean_architecture_rental_room/core/theme/app_theme.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:clean_architecture_rental_room/features/rental/presentation/bloc/cubit/page_controller_cubit.dart';

import 'package:clean_architecture_rental_room/features/rental/presentation/pages/index_route_page.dart';
import 'package:clean_architecture_rental_room/injection.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
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
        BlocProvider(create: (context) => sl<PageControllerCubit>()..savePage(0)),
      ],
      child: MaterialApp(
        title: 'Home Rental App',
        theme: AppTheme.appTheme(context),
        home: IndexRoutePage(),
      ),
    );
  }
}
