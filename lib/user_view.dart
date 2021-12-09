import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_hydrate/main.dart';
//import 'package:new_hydrate/auth.dart';
import 'package:new_hydrate/sign_up.dart';
import 'package:new_hydrate/loading.dart';
import 'package:new_hydrate/driver.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class user extends StatefulWidget {
  const user({Key? key}) : super(key: key);

  @override
  _user createState() => _user();
}

class _user extends State<user> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    late TextEditingController _controller;
    _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Select the water you have had so far today"),
      ),
      body: ListView(children: <Widget>[
        const Padding(padding: EdgeInsets.all(8.0)),
        Column(
          children: [           
            water(picture: "images/dasani.png", desc: "20 oz Dasani", size: 20),
            water(
              picture: "images/smartWater.png",
              desc: "20 oz Smart Water",
              size: 20,
            ),
            water(
              picture: "images/core.png",
              desc: "20 oz Core",
              size: 20,
            ),
            water(
              picture: "images/fiji.png",
              desc: "16.9 oz Fiji",
              size: 20,
            ),
            water(
              picture: "images/aquafina.png",
              desc: "16.9 oz Aquafina",
              size: 20,
            ),
            
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Custom Amount',
              ),
            )
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //total = water._counter + _controller;
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
//mainAxisAlignment: MainAxisAlignment.center,


class counters extends _user {
  counters(
      {Key? key, required this.picture, required this.desc, required this.size});
  String picture;
  String desc;
  int size;
  static int _counter = 0;

  @override
  Widget build(BuildContext context) {
    int total;
    int _dasaniCounter = 0;

    void _dasaniCounteradd() {
      setState(() {
        _dasaniCounter++;
      });
    }

    void _dasaniCountersub() {
      setState(() {
        _dasaniCounter--;
      });
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[         
          Text(desc),          
        ],
      ),
    );
  }
}



class water extends StatelessWidget {
  water(
      {Key? key, required this.picture, required this.desc, required this.size})
      : super(key: key);
  String picture;
  String desc;
  int size;
  static int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FittedBox(
            child:
                Image.asset(picture, fit: BoxFit.fill, height: 200, width: 200),
          ),
          Text(desc),
          IconButton(icon: Icon(Icons.remove), onPressed: () => _counter--),
          Text(_counter.toString()),
          IconButton(icon: Icon(Icons.add), onPressed: () => _counter++),
        ],
      ),
    );
  }
}


