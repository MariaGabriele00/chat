import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatUser _currentUser =
      ChatUser(id: '1', firstName: 'Maria', lastName: 'Gabriele');
  final ChatUser _userChatGpt =
      ChatUser(id: '2', firstName: 'Chat', lastName: 'GPT');
  List<ChatMessage> _message = <ChatMessage>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 135, 25, 150),
        title: const Text(
          'Chat GPT',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: DashChat(
        currentUser: _currentUser,
        messageOptions: const MessageOptions(
          currentUserContainerColor: Color.fromARGB(255, 255, 168, 197),
        ),
        onSend: (ChatMessage m) {
          getChatResponse(m);
        },
        messages: _message,
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _message.insert(0, m);
    });
  }
}
