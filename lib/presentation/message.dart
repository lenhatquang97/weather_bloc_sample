import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;

  // ignore: use_key_in_widget_constructors
  const Message({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(fontSize: 22.0, color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }
}
