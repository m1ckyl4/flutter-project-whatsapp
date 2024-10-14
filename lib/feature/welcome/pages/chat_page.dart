import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package for formatting date and time

class ChatPage extends StatefulWidget {
  final String name;
  final String message;

  const ChatPage({Key? key, required this.name, required this.message})
      : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, dynamic>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _firstAutoReply = false; // Track if the first automatic reply has been sent

  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          'message': _controller.text,
          'isUser': true,
          'timestamp': DateTime.now(), // Add timestamp for sent message
        });
        _controller.clear();
      });

      // Simulate first reply after user sends a message
      _simulateReply();
    }
  }

  void _simulateReply() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!_firstAutoReply) {
        setState(() {
          _messages.add({
            'message': "Hello, this is Mickyla's built clone of WhatsApp, I hope you enjoy!",
            'isUser': false, // Set to false for auto-reply
            'timestamp': DateTime.now(), // Add timestamp for auto-reply
            'bgColor': const Color(0xFF1F2C34), // Set background color to match message bar
          });
          _firstAutoReply = true; // Mark first auto-reply as sent
        });
      } else {
        setState(() {
          _messages.add({
            'message': 'Follow me on my Instagram @m1ckyl4',
            'isUser': false, 
            'timestamp': DateTime.now(), 
            'bgColor': const Color(0xFF1F2C34), 
          });
        });
      }
    });
  }

  String _formatTimestamp(DateTime timestamp) {
    return DateFormat('hh:mm a').format(timestamp); // Format the time as "hh:mm AM/PM"
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF111B21),
        iconTheme: const IconThemeData(color: Colors.white), // Set the back button color to white
        title: Text(widget.name, style: const TextStyle(color: Colors.white)),
        actions: [
          IconButton(icon: const Icon(Icons.call_outlined), onPressed: () {}),
          IconButton(icon: const Icon(Icons.videocam_outlined), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/chat_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            children: [
              // Centered floating text section
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 300, // Adjusted maximum width for the encryption message background
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1), // Low opacity background
                      borderRadius: BorderRadius.circular(8),
                      // Removed the border
                    ),
                    child: Column(
                      children: [
                        // Lock icon aligned with the first line of the message
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.lock, // Lock icon
                              color: Color(0xFFEBEBEB), // Match the icon color with the image
                              size: 12, // Smaller icon size to match text size
                            ),
                            const SizedBox(width: 4), // Space between icon and text
                            const Text(
                              "Messages",
                              style: TextStyle(
                                color: Color(0xFFEBEBEB),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        // Main text message centered
                        const SizedBox(height: 4), // Space between icon and main message
                        const Text(
                          "and calls are end-to-end encrypted. No one outside of this chat, not even WhatsApp, can read or listen to them. Tap to learn more.",
                          textAlign: TextAlign.center, // Center align the main text
                          style: TextStyle(
                            color: Color(0xFFEBEBEB), // Match text color with the image
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    bool isUser = _messages[index]['isUser'];
                    DateTime timestamp = _messages[index]['timestamp']; // Get timestamp
                    Color bgColor = isUser ? const Color(0xFF128C7E) : _messages[index]['bgColor'] ?? const Color(0xFFECE5DD); // Set bgColor based on user or auto-reply
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Align(
                        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                        child: ChatBubble(
                          message: _messages[index]['message'],
                          isUser: isUser,
                          timestamp: timestamp, // Pass timestamp to ChatBubble
                          bgColor: bgColor, // Pass bgColor to ChatBubble
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Bottom Messaging Bar with Microphone Outside the Container
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  children: [
                    // Message Input Bar
                    Expanded(
                      child: Container(
                        height: 48, // Slightly increased height
                        padding: const EdgeInsets.symmetric(horizontal: 10.0), // Adjust padding for content
                        decoration: BoxDecoration(
                          color: const Color(0xFF1F2C34),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Emoji icon
                            IconButton(
                              icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                              onPressed: () {},
                            ),
                            // Expanded input field
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _focusNode.requestFocus(); // Request focus when tapped
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF202C33), // Input background color
                                    borderRadius: BorderRadius.circular(20), // More rounded
                                  ),
                                  child: TextField(
                                    controller: _controller,
                                    focusNode: _focusNode, // Attach the focus node to the TextField
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      hintText: "Message",
                                      hintStyle: TextStyle(color: Colors.white54),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Clip (Attachment) icon
                            IconButton(
                              icon: const Icon(Icons.attach_file, color: Colors.grey),
                              onPressed: () {
                                // Handle attachment functionality here
                              },
                            ),
                            // Camera icon
                            IconButton(
                              icon: const Icon(Icons.camera_alt_outlined, color: Colors.grey),
                              onPressed: () {
                                // Handle camera functionality here
                              },
                            ),
                            // Send button
                            IconButton(
                              icon: const Icon(Icons.send, color: Color(0xFF128C7E)),
                              onPressed: _sendMessage,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10), // Space between message bar and mic button
                    // Microphone Button Outside the Message Bar
                    Container(
                      width: 48, // Slightly increased width
                      height: 48, // Slightly increased height
                      decoration: BoxDecoration(
                        color: const Color(0xFF128C7E), // Background color
                        shape: BoxShape.circle, // Circular background
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.mic, color: Colors.white),
                        iconSize: 24, // Adjusted icon size
                        onPressed: () {
                          // Implement microphone functionality here
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ChatBubble widget for the individual messages
class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final DateTime timestamp; // Added timestamp parameter
  final Color bgColor; // Added bgColor parameter

  const ChatBubble({Key? key, required this.message, required this.isUser, required this.timestamp, required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bgColor, // Use bgColor for the bubble background
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white), // Set text color to white
          ),
        ),
        const SizedBox(height: 4), // Space between bubble and timestamp
        Text(
          DateFormat('hh:mm a').format(timestamp), // Display formatted timestamp
          style: TextStyle(color: Colors.grey[600], fontSize: 10),
        ),
      ],
    );
  }
}
