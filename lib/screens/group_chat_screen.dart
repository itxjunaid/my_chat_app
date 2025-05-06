import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupChatScreen extends StatefulWidget {
  static const String routeName = '/group-chat';

  const GroupChatScreen({Key? key}) : super(key: key);

  @override
  _GroupChatScreenState createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage(String text, MessageType type) {
    if (text.trim().isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(text: text, type: type, sender: type == MessageType.sent ? 'You' : 'Member'));
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              radius: 20,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Group Name'),
                Text('5 Members', style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.group),
            onPressed: () {
               showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Members', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        ListTile(leading: CircleAvatar(backgroundImage: NetworkImage('https://via.placeholder.com/150')),title: Text('Member 1')),
                         ListTile(leading: CircleAvatar(backgroundImage: NetworkImage('https://via.placeholder.com/150')),title: Text('Member 2')),
                         ListTile(leading: CircleAvatar(backgroundImage: NetworkImage('https://via.placeholder.com/150')),title: Text('Member 3')),
                          ListTile(leading: CircleAvatar(backgroundImage: NetworkImage('https://via.placeholder.com/150')),title: Text('Member 4')),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ChatBubble(message: message);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.emoji_emotions),
                  onPressed: () {
                    // Placeholder for emoji picker
                    print('Open emoji picker');
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(_messageController.text, MessageType.sent),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum MessageType { sent, received }

class ChatMessage {
  final String text;
  final MessageType type;
  final String sender;

  ChatMessage({required this.text, required this.type, required this.sender});
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Align(
        alignment: message.type == MessageType.sent ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: message.type == MessageType.sent ? Colors.blue[100] : Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: message.type == MessageType.sent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(message.sender, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              SizedBox(height: 4),
              Text(message.text),
            ],
          ),
        ),
      ),
    );
  }
}