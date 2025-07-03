import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/pages/login_page.dart';
import 'package:clean_architecture_rental_room/features/rental/presentation/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchPage extends StatelessWidget {
  const SwitchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<AuthBloc>(),
      builder: (context, state) {
        if (state is AuthSuccessState) {
          return HomePage();
        } else if (state is AuthLoadingState) {
          return Scaffold(body: Center(child: CupertinoActivityIndicator()));
        } else {
          return LoginPage();
        }
      },
    );
  }
}
