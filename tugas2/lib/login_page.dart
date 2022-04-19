import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas2/dashboard.dart';
import 'package:tugas2/register_page.dart';

import 'model/user_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final Future<SharedPreferences> _myPref = SharedPreferences.getInstance();

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  final String user = "mobileb";
  final String password = "mobileb123";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: TextFormField(
              controller: _username,
              decoration: const InputDecoration(
                  hintText: "Username",
                  contentPadding: EdgeInsets.all(5)
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: TextFormField(
              controller: _password,
              decoration: const InputDecoration(
                  hintText: "Password",
                  contentPadding: EdgeInsets.all(5)
              ),
            ),
          ),
          _loginButton(context),
          _registerButton(context),
        ],
      )
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: Text("Login"),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
        ),
        onPressed: () {
          String currentUsername = _username.value.text;
          String currentPassword = _password.value.text;

          _prosesLogin(currentUsername, currentPassword);
        }
      ),
    );
  }

  Widget _registerButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: Text("Register"),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },
      ),
    );
  }

  void _prosesLogin(String username, String pass) async {
    if(username == user && pass == password){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }
}