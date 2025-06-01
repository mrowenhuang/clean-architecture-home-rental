import 'package:clean_architecture_rental_room/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

class SwitchPage extends StatelessWidget {
  const SwitchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignupPage());
  }
}
