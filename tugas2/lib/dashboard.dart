import 'package:flutter/material.dart';
import 'package:tugas2/login_page.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          actions: [
            IconButton(
              onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));},
              icon: Icon(
                Icons.logout,
              ),
            )
          ],
        ),
        body: Container(
          child: Column(
              children: [Text("Mobileb", textAlign: TextAlign.center)]
          ),
        ),
    );
  }
}