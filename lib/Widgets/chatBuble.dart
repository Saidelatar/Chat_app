import 'package:chat_app/Constants.dart';
import 'package:chat_app/models/messages.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:chat_app/models/messages.dart';
import 'package:chat_app/Constants.dart';

class ChatBuble extends StatelessWidget {
  final MessageModel message;
  final bool isCurrentUser;

  const ChatBuble({Key? key, required this.message, this.isCurrentUser = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 25, bottom: 25, right: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(isCurrentUser ? 0 : 32),
            bottomLeft: Radius.circular(isCurrentUser ? 32 : 0),
          ),
          color: isCurrentUser ? kprimaryKey : Color(0xff006d84),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
/*
class ChatBubleFromFriend extends StatelessWidget {
  final MessageModel message;

  const ChatBubleFromFriend({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 25, bottom: 25, right: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(0),
            bottomLeft: Radius.circular(32),
          ),
          color: Colors.orange,
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
*/