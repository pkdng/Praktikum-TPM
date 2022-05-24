import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'user_page.dart';

import 'data_source.dart';
import 'user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              FontAwesomeIcons.github,
              size: 80,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Text(
                'Github User Search',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            child: Center(
              child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'username',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UserPage(username: _usernameController.value.text),
                            )
                        );
                      }
                    )
                  )
              ),
            )
          ),
        ],
      )
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  // Widget _buildSuccessSection(UserModel data) {
  //   return (
  //       Navigator.of(context).push(
  //           MaterialPageRoute(
  //             builder: (context) => UserPage(),
  //           )
  //       );
  //   )
  // }
}
