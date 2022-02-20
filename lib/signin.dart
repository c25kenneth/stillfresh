import 'package:flutter/material.dart';
import 'package:stillfresh/Home.dart';
import 'package:stillfresh/firebaseauth.dart';
import 'package:stillfresh/main.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String email = ''; 
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(title: const Text("Sign In for StillFresh!"),
        actions: [
          MaterialButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
          }, child: Text('Sign Up!'),),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/stillfreshlogo.png', width: 300, height: 300),      
            SizedBox(height: 25.0,),
            Container(
              width: 350,
              child: TextField(
                onChanged: (val){
                  setState(() {
                    email = val; 
                  });
                },
                decoration: InputDecoration(
                  hintText: "Email",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
                ),
            ),

            SizedBox(height: 15.0),

            Container(
              width: 350,
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    password = val; 
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)))
                ),
            ),

            SizedBox(height: 35.0,),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text(
                'Sign In!',
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                signIn(email, password);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ],
        ),
      ),
    );
  }
}