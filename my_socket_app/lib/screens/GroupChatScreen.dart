import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatScreen extends StatefulWidget {
  final String userName;
  const ChatScreen({super.key, required this.userName});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late WebSocketChannel _channel;
  List<String> _messages = [];

  @override
  void initState() {
    super.initState();

    _channel = IOWebSocketChannel.connect('ws://192.168.0.122:3000');
    _channel.stream.listen((message) {
      setState(() {
        _messages.add(message);
        if (kDebugMode) {
          print("Message here: $message");
        }
      });
      // Scroll to the latest message
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }, onError: (error) {
      if (kDebugMode) {
        print('WebSocket Error: $error');
      }
    }, onDone: () {
      if (kDebugMode) {
        print('WebSocket Connection Closed');
      }
    });
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  void _sendMessage(String message) {
    _channel.sink.add(message);
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfee6fb),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment:
                      _messages[index].split(':').first == widget.userName
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 207, 96, 74),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      _messages[index],
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                    ),
                    onSubmitted: (value) {
                      if (_messageController.text.trim().isNotEmpty) {
                        _sendMessage(
                            "${widget.userName}:- ${_messageController.text}");
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_messageController.text.trim().isNotEmpty) {
                      _sendMessage(
                          "${widget.userName}:- ${_messageController.text}");
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
