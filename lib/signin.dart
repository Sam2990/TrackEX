import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'functions.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  final emailsign = TextEditingController();
  final paswordsign = TextEditingController();
  final namesignr = TextEditingController();

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
                child: Text('SignUp', style: TextStyle(
                    color: Colors.white, fontSize: 40
                ),),
              ),
              SizedBox(height: 6,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('And Join Us', style: TextStyle(
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
                              controller: emailsign,
                              decoration: InputDecoration(
                                hintText: 'Email Address',
                                helperStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 26,),
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
                              controller: paswordsign,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                helperStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 26,),
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          padding: EdgeInsets.only(left: 10, right: 10),
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
                              controller: namesignr,
                              decoration: InputDecoration(
                                hintText: 'Username',
                                helperStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 56,),
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
                            child: Text('Sign Up', style: TextStyle(
                              color: Colors.white,
                            ),),
                            onPressed: () {

                              // String? namesign = namesignr.toString();
                                String namesign = namesignr.text;
                                print(namesign);
                              signup(emailsign, paswordsign,namesign,context);
                            },
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            SizedBox(width: MediaQuery.of(context).size.width*0.24,),
                            Text('Have you already been here ?',style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),),
                            // SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: Text('Login',style: TextStyle(
                              color:Color(0xffe65100),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
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
    }
  }




