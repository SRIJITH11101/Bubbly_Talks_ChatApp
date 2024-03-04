import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class msgbubble extends StatelessWidget {
  final String text, sender;
  final String? name;
  final bool isMe;
  final Timestamp time;

  const msgbubble(
      {super.key,
      required this.text,
      required this.sender,
      required this.name,
      required this.isMe,
      required this.time});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = time.toDate();
    String times = DateFormat.Hm().format(dateTime);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(name ?? "Anonomus"),
          Material(
              borderRadius: BorderRadius.only(
                  topLeft: isMe ? Radius.circular(20) : Radius.circular(0),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: isMe ? Radius.circular(0) : Radius.circular(20)),
              elevation: 5,
              color: isMe ? Colors.lightBlueAccent : Colors.blueAccent,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(text),
              )),
          Text(
            times,
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
