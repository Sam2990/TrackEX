import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'HomePage.dart';
import 'newdata.dart';
import 'stats.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options : DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      // RealtimeLineGraph(),
      //Newdata(),
      StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return HomePage();
          }else if(snapshot.connectionState==ConnectionState.waiting){
           return const Center(child: CircularProgressIndicator(),);
          } else if(snapshot.hasError){
            return const Center(child: Text('Someting Wrong Try Again Later'),);
          }
          else{
            return Login();
          }
        },
      ),
    );
  }
}
