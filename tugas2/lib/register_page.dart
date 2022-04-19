import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tugas2/login_page.dart';
import 'package:tugas2/model/user_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {

  Box<UserModel> localDB = Hive.box<UserModel>("user");
  
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register Page"),
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
            _registerButton(context),
          ],
        )
    );
  }

  Widget _registerButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: Text("Register"),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
        ),
        onPressed: () {
          localDB.add(UserModel(username: _username.text, password: _password.text));
          Navigator.pop(context);
        },
      ),
    );
  }
}
