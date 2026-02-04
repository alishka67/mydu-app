import 'package:flutter/material.dart';
import 'chat_detail_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  static const Color bg = Color(0xFF121212);
  static const Color card = Color(0xFF1E1E1E);

  @override
  Widget build(BuildContext context) {
    final chats = [
      ChatItem(
        name: "AI MyDu",
        lastMessage: "Ask me about studies, dormitory, GPA…",
        time: "19:12",
        unread: true,
        unreadCount: 1,
        isAI: true,
      ),
      ChatItem(
        name: "Mukhmetov Olzhas",
        lastMessage: "Lecture materials updated",
        time: "18:45",
      ),
      ChatItem(
        name: "Merzekhan Akerke",
        lastMessage: "Practice task for next week",
        time: "17:30",
        unread: true,
        unreadCount: 2,
      ),
      ChatItem(
        name: "Zhangirkhan Khabiyev",
        lastMessage: "Your HW is graded",
        time: "16:10",
      ),
    ];

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        title: const Text("Chats"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: chats.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, i) => _chatTile(context, chats[i]),
      ),
    );
  }

  Widget _chatTile(BuildContext context, ChatItem chat) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatDetailScreen(
              title: chat.name,
              isAI: chat.isAI,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor:
                  chat.isAI ? Colors.blue : Colors.grey.shade700,
              child: Icon(
                chat.isAI ? Icons.smart_toy : Icons.person,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          chat.unread ? FontWeight.bold : FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    chat.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: chat.unread ? Colors.white : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat.time,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 6),
                if (chat.unread)
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      chat.unreadCount.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChatItem {
  final String name;
  final String lastMessage;
  final String time;
  final bool unread;
  final int unreadCount;
  final bool isAI;

  ChatItem({
    required this.name,
    required this.lastMessage,
    required this.time,
    this.unread = false,
    this.unreadCount = 0,
    this.isAI = false,
  });
}