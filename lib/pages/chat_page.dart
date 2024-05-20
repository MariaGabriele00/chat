import 'dart:convert';

import 'package:chat/consts.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatUser _user = ChatUser(
    id: '1',
    firstName: 'Maria',
    lastName: 'Gabi',
  );

  final ChatUser _gptChatUser = ChatUser(
    id: '2',
    firstName: 'Gemini',
    lastName: 'Chat',
  );

  final List<ChatMessage> allMessages = [];
  final List<ChatUser> typingUsers = <ChatUser>[];
  getData(ChatMessage m) async {
    typingUsers.add(_gptChatUser);
    allMessages.insert(0, m);
    setState(() {});
    var data = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };
    await http
        .post(Uri.parse(urlGoogle), headers: header, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        ChatMessage m1 = ChatMessage(
          user: _gptChatUser,
          createdAt: DateTime.now(),
          text: result["candidates"][0]["content"]["parts"][0]["text"],
        );
        allMessages.insert(0, m1);
      }
    }).catchError((e) {});
    typingUsers.remove(_gptChatUser);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(103, 0, 151, 1),
        title: const Text(
          'Chat',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: DashChat(
        currentUser: _user,
        messageOptions: const MessageOptions(
          showTime: true,
          currentUserContainerColor: Color.fromRGBO(52, 47, 54, 1),
          containerColor: Color.fromRGBO(103, 0, 151, 1),
          textColor: Colors.white,
        ),
        onSend: (ChatMessage m) {
          getData(m);
        },
        messages: allMessages,
        typingUsers: typingUsers,
      ),
    );
  }
}
