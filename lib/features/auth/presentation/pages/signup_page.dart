import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clean_architecture_rental_room/core/navigation/app_navigation.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSingupFailedState) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  margin: EdgeInsets.only(bottom: size.height - 200),
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: 'Singup Failed',
                    message: state.message.substring(
                      state.message.indexOf(']') + 2,
                    ),
                    contentType: ContentType.failure,
                  ),
                ),
              );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: size.height - 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Material(
                        borderRadius: BorderRadius.circular(100),
                        elevation: 5,
                        child: CircleAvatar(
                          maxRadius: 100,
                          backgroundImage: AssetImage(
                            'assets/logo/tinggal.jpg',
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sign Up', style: TextStyle(fontSize: 20)),
                          SizedBox(height: 10),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(10),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isNotEmpty && value.length <= 8) {
                                  return 'Name Need 8 Character';
                                } else if (value.isEmpty) {
                                  return 'Please Fill The Name';
                                }
                                return null;
                              },
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
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Fill The Mail';
                                }
                                return null;
                              },
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
                            child: TextFormField(
                              controller: passC,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isNotEmpty && value.length < 8) {
                                  return 'Password Need More Than 8 Char';
                                } else if (value.isEmpty) {
                                  return 'Please Fill The Password';
                                }
                                return null;
                              },
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
                                'Have Account, ',
                                style: TextStyle(fontSize: 12),
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppNavigation.pushNavigation(
                                    context,
                                    LoginPage(),
                                  );
                                },
                                child: Text(
                                  'Login',
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
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                  SignupAuthEvent(
                                    user: UserEntities(
                                      email: emailC.text.trim(),
                                      username: nameC.text.trim(),
                                      password: passC.text.trim(),
                                    ),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              fixedSize: Size(size.width, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text("Sign Up"),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
