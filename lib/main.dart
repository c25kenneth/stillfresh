import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stillfresh/Home.dart';
import 'package:stillfresh/firebaseauth.dart';
import 'package:stillfresh/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple[100]
      ),
      
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(title: const Text("Sign Up for StillFresh!"),
        actions: [
          MaterialButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
          }, child: Text('Sign In!'),),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/stillfreshlogo.png', width: 300, height: 300),      
              SizedBox(height: 15.0,),
              Container(
                width: 350,
                child: TextField(
                  onChanged: (val) {
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
      
              SizedBox(height: 10.0),
      
              Container(
                width: 350,
                child: TextField(
                  onChanged: (val){
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
      
              SizedBox(height: 10.0,),
              //flutter run --no-sound-null-safety
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text(
                  'Sign Up!',
                  style: TextStyle(fontSize: 30),
                ),
                onPressed: () {
                  Register(email, password); 
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
