// ignore_for_file: must_be_immutable
import 'package:chat_app/Constants.dart';
import 'package:chat_app/Views/chat_page.dart';
import 'package:chat_app/Views/register_page.dart';
import 'package:chat_app/Widgets/Button.dart';
import 'package:chat_app/Widgets/Textfield.dart';
import 'package:chat_app/helper/Show_Snac_Bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class LoginPage extends StatefulWidget {
  static String id = 'register_id';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;
  bool isLoading = false;
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kprimaryKey,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                SizedBox(height: 100),
                Image(
                  image: AssetImage('assets/images/scholar.png'),
                  height: 80,
                ),
                Center(
                  child: Text(
                    'Scholar Chat',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                category(
                  obscureText: false,
                  onChanged: (data) {
                    email = data;
                  },
                  text: 'Email',
                ),
                SizedBox(
                  height: 15,
                ),
                category(
                  obscureText: true,
                  onChanged: (data) {
                    password = data;
                  },
                  text: 'password',
                ),
                SizedBox(
                  height: 20,
                ),
                Button(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await loginUser();
                          Navigator.pushNamed(context, ChatPage.id ,arguments:email );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "INVALID_LOGIN_CREDENTIALS") {
                           ShowSnackBar(context, 'Invalid Email Or Password');
                          }
                          if (e.code == 'user-not-found') {
                            ShowSnackBar(context, 'User not found');
                          } else if (e.code == 'wrong-password') {
                            ShowSnackBar(context, 'Wrong Password');
                          } else {
                            ShowSnackBar(
                                context, 'An Error has occourd , try again');
                          }
                        } catch (e) {
                          ShowSnackBar(
                                context, e.toString());
                        }
                      }
                      isLoading = false;
                      setState(() {});
                    },
                    text: 'Sign In'),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: Text(
                        'SignUp ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
