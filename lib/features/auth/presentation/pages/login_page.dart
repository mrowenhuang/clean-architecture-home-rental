import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                Text('Login', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Password",
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text('Dont Have Account, ', style: TextStyle(fontSize: 12)),
                    Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15),
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
    );
  }
}
