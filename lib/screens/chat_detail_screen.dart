import 'package:flutter/material.dart';

class ChatDetailScreen extends StatefulWidget {
  final String title;
  final bool isAI;

  const ChatDetailScreen({
    super.key,
    required this.title,
    required this.isAI,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<_Message> _messages = [];

  static const bg = Color(0xFF121212);
  static const card = Color(0xFF1E1E1E);

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _messages.add(_Message(
        text: _controller.text,
        isUser: true,
      ));
    });

    final userText = _controller.text;
    _controller.clear();

    if (widget.isAI) {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _messages.add(_Message(
            text: _aiReply(userText),
            isUser: false,
          ));
        });
      });
    }
  }

  String _aiReply(String text) {
    final t = text.toLowerCase();

    if (t.contains("dorm")) {
      return "You can apply for dormitory through the student portal.";
    }
    if (t.contains("gpa")) {
      return "Your GPA is calculated based on all graded subjects.";
    }
    if (t.contains("scholarship")) {
      return "Scholarship depends on GPA and academic performance.";
    }
    if (t.contains("deadline")) {
      return "You can see deadlines on the Home screen.";
    }
    return "I can help you with studies, dormitory, GPA and university rules.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (_, i) {
                final msg = _messages[i];
                return Align(
                  alignment:
                      msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: msg.isUser ? Colors.blue : card,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(msg.text),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: bg,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: card,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }  
}
class _Message {
  final String text;
  final bool isUser;

  _Message({required this.text, required this.isUser});
}