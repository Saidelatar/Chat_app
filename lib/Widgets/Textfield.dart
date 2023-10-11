// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class category extends StatelessWidget {
  String? text;
  Function(String)? onChanged;
  bool? obscureText ; 


  category({this.onChanged, this.text , this.obscureText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (data)
          // ignore: body_might_complete_normally_nullable
          {
        if (data!.isEmpty) {
          return 'field required';
        } 
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: text,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
