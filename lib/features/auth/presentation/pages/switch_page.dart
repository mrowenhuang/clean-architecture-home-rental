import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/pages/login_page.dart';
import 'package:clean_architecture_rental_room/features/rental/presentation/pages/home/home_page.dart';
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
        print(state);
        if (state is AuthSuccessState) {
          return HomePage();
        } else if (state is AuthFailedState ||
            state is AuthInitial ||
            state is AuthSignoutSuccess) {
          return LoginPage();
        } else {
          return Scaffold(body: Center(child: CupertinoActivityIndicator()));
        }
      },
    );
  }
}
