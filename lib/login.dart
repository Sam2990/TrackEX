import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trackex/home.dart';
import 'signin.dart';
import 'main.dart';
import 'functions.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  final emaillogin = TextEditingController();
  final paswordlogin = TextEditingController();

  void dispose() {
    emaillogin.dispose();
    paswordlogin.dispose();
    super.dispose();
  }

  // Future login() async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emaillogin.text.trim(),
  //       password: paswordlogin.text.trim(),
  //     );
  //     emaillogin.clear();
  //     paswordlogin.clear();
  //     Navigator.replace(
  //         context, oldRoute: MaterialPageRoute(builder: (context) => Login()),
  //         newRoute: MaterialPageRoute(builder: (context) => home()));
  //   } on FirebaseAuthException catch (e) {
  //     final snackBar = SnackBar(
  //         content: Text(e.code),
  //         action: SnackBarAction(
  //           label: 'Undo',
  //           onPressed: () {
  //             // Some code to undo the change.
  //             emaillogin.clear();
  //             paswordlogin.clear();
  //           },
  //         )
  //     );
  //   }
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Color(0xffe65100),
                    Color(0xfff56300),
                    Color(0xfff99301),
                    Color(0xfff7Bc00)
                  ]
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.16,),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('Login', style: TextStyle(
                    color: Colors.white, fontSize: 40
                ),),
              ),
              SizedBox(height: 4,),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text('Welcome Back', style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),),
              ),
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.05,),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(42),
                        topLeft: Radius.circular(42),),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 86,),
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                             // color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, 0.3),
                                blurRadius: 0.5,
                                // offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: TextField(
                              controller: emaillogin,
                              decoration: InputDecoration(
                                hintText: 'Email Address',
                                helperStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 36,),
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          padding: EdgeInsets.only(left: 10, right: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, 0.3),
                                blurRadius: 0.5,
                                // offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: TextField(
                              controller: paswordlogin,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                helperStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 80,),
                        Container(
                          height: 48,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color(0xffe65100),
                          ),
                          child: TextButton(
                            child: Text('Login', style: TextStyle(
                              color: Colors.white,
                            ),),
                            onPressed: () {
                              login( emaillogin, paswordlogin, context);
                            },
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            SizedBox(width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.50,),
                            Text('New Here?', style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              // fontWeight: FontWeight.w300,
                            ),),
                            // SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                            TextButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Signup(),));
                            }, child: Text('SignUp', style: TextStyle(
                              color: Color(0xffe65100),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),))
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
      // Future login(TextEditingController emaillogin) async {
      //   try {
      //     await FirebaseAuth.instance.signInWithEmailAndPassword(
      //       email: emaillogin.text.trim(),
      //       password: paswordlogin.text.trim(),
      //     );
      //     emaillogin.clear();
      //     paswordlogin.clear();
      //     Navigator.replace(context,
      //         oldRoute: MaterialPageRoute(builder: (context) => Login()),
      //         newRoute: MaterialPageRoute(builder: (context) => home()));
      //   } on FirebaseAuthException catch (e) {
      //     final snackBar = SnackBar(
      //         content: Text(e.code),
      //         action: SnackBarAction(
      //           label: 'Undo',
      //           onPressed: () {
      //             // Some code to undo the change.
      //             emaillogin.clear();
      //             paswordlogin.clear();
      //           },
      //         )
      //     );
      //   }
      // }
    }
  }
