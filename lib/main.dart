import 'package:chat_app/Views/Login_page.dart';
import 'package:chat_app/Views/chat_page.dart';
import 'package:chat_app/Views/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(HomeView());
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RegisterPage.id: (context) => RegisterPage() ,
         LoginPage.id:(context) => LoginPage() ,
         ChatPage.id :(context) =>  ChatPage(),
      } ,
     debugShowCheckedModeBanner: false,
     home: LoginPage(),
    );
  }
}
