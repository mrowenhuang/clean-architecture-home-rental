import 'package:clean_architecture_rental_room/core/network/api_network.dart';
import 'package:clean_architecture_rental_room/core/network/dio.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class TestPage extends StatelessWidget {
  TestPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                              onTap: () {},
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
                          onPressed: () async {
                            await login(emailC.text, passC.text);
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
                        SizedBox(height: 10),
                        ElevatedButton.icon(
                          label: Text("Google Login"),
                          icon: Image.asset(
                            'assets/logo/google.png',
                            height: 25,
                          ),
                          onPressed: () async {
                            // await getBook();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            fixedSize: Size(size.width, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
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
    );
  }
}

Future<void> login(String email, String password) async {
  final Dio dio = Conn.dio;
  final GetStorage storage = GetStorage();

  try {
    final response = await dio.post(
      ApiNetwork.loginApi,
      data: {"email": email, "password": password},
    );

    if (response.statusCode == 200) {
      await storage.write("access_token", response.data['token']);
      print(response.data);
    }
  } catch (e) {
    if (e is DioException) {
      var error = e.error as Map;
      print(error['message']);
    }
  }
}

// Future<void> getBook() async {
//   final Dio dio = Conn.dio;
//   final GetStorage storage = GetStorage();

//   try {
//     var tok = storage.read("access_token");

//     print(tok);

//     final response = await dio.get(ApiNetwork.bookApi);

//     if (response.statusCode == 200) {
//       print(response.data);
//     }
//   } catch (e) {
//     if (e is DioException) {
//       var error = e.error as Map;
//       print(error['message']);
//     }
//   }
// }
