import 'package:flutter/material.dart';

class ChatTab extends StatefulWidget {
    @override
    ChatState createState() => ChatState();
}

class ChatState extends State<ChatTab> {
    @override
    Widget build(BuildContext context) {
        return Center(
            child: Text("Hello Chat"),
        );
    }
}
