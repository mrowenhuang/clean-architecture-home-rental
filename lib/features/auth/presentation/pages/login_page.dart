import 'package:clean_architecture_rental_room/core/navigation/app_navigation.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController emailC = TextEditingController();
    final TextEditingController passC = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: size.height,
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Material(
                      borderRadius: BorderRadius.circular(100),
                      elevation: 5,
                      child: CircleAvatar(
                        maxRadius: 100,
                        backgroundImage: AssetImage('assets/logo/tinggal.jpg'),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Login', style: TextStyle(fontSize: 20)),
                      SizedBox(height: 10),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: TextField(
                          controller: emailC,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Email",
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: TextField(
                          controller: passC,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Password",
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dont Have Account, ',
                            style: TextStyle(fontSize: 12),
                          ),
                          GestureDetector(
                            onTap: () {
                              AppNavigation.pushNavigation(
                                context,
                                SignupPage(),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                            SinginAuthEvent(
                              user: UserEntities(
                                email: emailC.text.trim(),
                                password: passC.text.trim(),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: Size(size.width, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text("Login"),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
