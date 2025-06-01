import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController nameC = TextEditingController();
    final TextEditingController emailC = TextEditingController();
    final TextEditingController passC = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Material(
                  borderRadius: BorderRadius.circular(100),
                  elevation: 5,
                  child: CircleAvatar(
                    maxRadius: 120,
                    backgroundImage: AssetImage('assets/logo/tinggal.jpg'),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text('Sign Up', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: TextField(
                      controller: nameC,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Name",
                      ),
                    ),
                  ),
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
                      Text('Have Account, ', style: TextStyle(fontSize: 12)),
                      Text(
                        'Login',
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        SignupAuthEvent(
                          user: UserEntities(
                            email: emailC.text.trim(),
                            username: nameC.text.trim(),
                            password: passC.text.trim(),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      fixedSize: Size(size.width, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(15),
                      ),
                    ),
                    child: Text("Sign Up"),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
