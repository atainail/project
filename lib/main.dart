import 'package:flutter/material.dart';
import 'package:new_hydrate/daily.dart';
import 'package:new_hydrate/login.dart';
import 'package:new_hydrate/sign_up.dart';
import 'package:new_hydrate/user_view.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hydrate!!',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Hydrate!!'),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FittedBox(
              child: Image.asset("images/hydrate.png", 
              fit: BoxFit.fill,
              height: 400, width: 400)),
            const Text(
              'Welcome to Hydrate!',
            ),
            const Text(
              'How would you like to proceed?',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              buttonLink(buttonText: "Login", destination: login()),
              buttonLink(buttonText: "Sign Up", destination: SignUp()),
              buttonLink(buttonText: "Anon", destination: login()),
              buttonLink(buttonText: "(User View)", destination: user()),
              buttonLink(buttonText: "(Daily)", destination: daily())
              ]
              ),
            ])        
        ),
    );
  }
}

class buttonLink extends StatelessWidget {
  buttonLink({Key? key, required this.buttonText, required this.destination})
      : super(key: key);
  String buttonText;
  Widget destination;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => destination));
            },
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}



