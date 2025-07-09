import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clean_architecture_rental_room/core/navigation/app_navigation.dart';
import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:clean_architecture_rental_room/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        bloc: context.read<LoginBloc>(),
        listener: (context, state) {
          if (state is AuthSinginFailedState) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  margin: EdgeInsets.only(bottom: size.height - 200),
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: 'Login Failed',
                    message: state.message.substring(
                      state.message.indexOf(']') + 2,
                    ),
                    contentType: ContentType.failure,
                  ),
                ),
              );
          } else if (state is AuthSigninSuccessState) {
            context.read<AuthBloc>().add(InitialAuthEvent());
          }
        },
        child: SingleChildScrollView(
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
                          Text('Login', style: TextStyle(fontSize: 20)),
                          SizedBox(height: 10),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(10),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isNotEmpty && value.length > 2) {
                                  return null;
                                } else if (value.isEmpty) {
                                  return 'Input your email';
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
                              validator: (value) {
                                if (value!.isNotEmpty && value.length > 2) {
                                  return null;
                                } else if (value.isEmpty) {
                                  return 'Input your password';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.done,
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
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                  SinginAuthEvent(
                                    user: UserEntities(
                                      email: emailC.text.trim(),
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
                            child: Text("Login"),
                          ),
                          // SizedBox(height: 10),
                          // ElevatedButton.icon(
                          //   label: Text("Google Login"),
                          //   icon: Image.asset(
                          //     'assets/logo/google.png',
                          //     height: 25,
                          //   ),
                          //   onPressed: () {
                          //     context.read<AuthBloc>().add(SinginAuthGoogle());
                          //   },
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: Colors.black,
                          //     fixedSize: Size(size.width, 50),
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(15),
                          //     ),
                          //   ),
                          // ),
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
