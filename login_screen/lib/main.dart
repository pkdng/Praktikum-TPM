import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Login Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(30,0,30,40),
              child: const FlutterLogo(),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30,10,30,10),
              child: const TextField(
                      decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                      hintText: 'Email',
                      contentPadding: EdgeInsets.fromLTRB(20,0,0,0)
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30,0,30,10),
              child: const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                      hintText: 'Password',
                      contentPadding: EdgeInsets.fromLTRB(20,0,0,0)
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30,15,30,5),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(35),
                  ),
                  onPressed: (){},
                  child: const Text('Log In')
              ),
            ),
            const Text(
              'Forgot password?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.bold
              )
            )
          ],
        ),
      ),
    );
  }
}
