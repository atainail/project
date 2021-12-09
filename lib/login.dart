import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_hydrate/main.dart';
//import 'package:new_hydrate/auth.dart';
import 'package:new_hydrate/sign_up.dart';
import 'package:new_hydrate/loading.dart';
import 'package:new_hydrate/driver.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

   @override
  _login createState() => _login();
}


class _login extends State<login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController, _passwordController;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _loading = false;
  String _email = "";
  String _password = "";



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    final emailInput = TextFormField(
      autocorrect: false,
      controller: _emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "EMAIL ADDRESS",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          hintText: 'Enter Email'),
    );
    final passwordInput = TextFormField(
      autocorrect: false,
      controller: _passwordController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Password';
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "PASSWORD",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        hintText: 'Enter Password',
        suffixIcon: Padding(
          padding: EdgeInsets.all(15), // add padding to adjust icon
          child: Icon(Icons.lock),
        ),
      ),
    );
    final submitButton = OutlinedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Processing Data')));
          _email = _emailController.text;
          _password = _passwordController.text;

          // _emailController.clear();
          // _passwordController.clear();

          setState(() {
            _loading = true;
            login();
          });
        }
      },
      child: const Text('Submit'),
    );

    final registerButton = OutlinedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (con) => const SignUp()));
      },
      child: const Text('Register'),
    );
     return Scaffold(
       
      body: Center( 
        
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
         FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Something Went Wrong");
            } else if (snapshot.connectionState == ConnectionState.done) {
              return AppDriver();} else {
              return Container(color: Colors.yellow);
         }}),
         
      
            _auth.currentUser != null
                ? Text(_auth.currentUser!.uid)
                : _loading
                    ? Loading()
                    : Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            // Add TextFormFields and ElevatedButton here.
                            emailInput,
                            passwordInput,
                            submitButton,
                            registerButton
                          ],
                        ),
                      )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> login() async {
    try {
      UserCredential _ = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (con) => AppDriver()));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user found for that email.')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Wrong password provided for that user.')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Something Else")));
      }
    } catch (e) {
      print(e);
    }

    setState(() {
      _loading = false;
    });
  }
} 
  
