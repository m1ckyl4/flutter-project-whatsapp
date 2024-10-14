import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/feature/welcome/pages/update_pg.dart'; 
import 'package:whatsapp_messenger/feature/welcome/pages/chat_page.dart'; 
import 'package:whatsapp_messenger/feature/welcome/pages/community_pg.dart';  // Import Community Page
import 'package:whatsapp_messenger/feature/welcome/pages/calls_pg.dart';  // Import Calls Page

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  int _currentIndex = 0;
  String _selectedFilter = 'All'; 

  // Add CommunityPage and CallsPage to the pages list
  final List<Widget> _pages = [
    const ChatsPage(), // Chats page
    const UpdatesPage(),
    const CommunityPage(), // Community page
    const CallsPage() // Calls page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111B21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111B21),
        title: Text(
          _currentIndex == 0
              ? 'WhatsApp'
              : _currentIndex == 1
                  ? 'Updates'
                  : _currentIndex == 2
                      ? 'Communities'
                      : 'Calls',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.camera_alt_outlined, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          if (_currentIndex == 0) // Only show buttons in ChatsPage
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildFilterButton('All'),
                  const SizedBox(width: 8),
                  _buildFilterButton('Unread'),
                  const SizedBox(width: 8),
                  _buildFilterButton('Favorites'),
                  const SizedBox(width: 8),
                  _buildFilterButton('Groups'),
                ],
              ),
            ),
          Expanded(child: _pages[_currentIndex]), // Dynamically load the selected page
          if (_currentIndex == 0) // Only show in ChatsPage
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Text(
                    'Tap and hold on a chat for more options',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock, color: Colors.grey, size: 16),
                      SizedBox(width: 4),
                      Text('Your personal messages are ', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text('end-to-end encrypted', style: TextStyle(color: Color(0xFF00A884), fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          BottomNavigationBar(
            backgroundColor: const Color(0xFF111B21),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white54,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index; // Update the index based on the selected tab
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: _buildNavItem(Icons.chat, 'Chats', 0),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildNavItem(Icons.camera_alt, 'Updates', 1),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildNavItem(Icons.people, 'Communities', 2), // Communities index is 2
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildNavItem(Icons.call, 'Calls', 3),
                label: '',
              ),
            ],
            type: BottomNavigationBarType.fixed,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    bool isSelected = _selectedFilter == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00A884) : const Color(0xFF2A3942),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Smaller padding for smaller button size
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[400],
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // Method to build a navigation item with rounded background for the icon
  Widget _buildNavItem(IconData iconData, String label, int index) {
    bool isSelected = _currentIndex == index;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF00A884) : Colors.transparent,
            borderRadius: BorderRadius.circular(16), // Adjusted for rounded shape similar to the image
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(iconData, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatItem(
          name: 'Mary Loi Yves Ricalde',
          message: 'beh please come to thailand tsaka sabihin mo kay mikha ang ganda nya',
          time: '9:00 PM',
          imageUrl: 'assets/images/maloi.jpg',
          onTap: () {},
        ),
        ChatItem(
          name: 'My Beloved Mother',
          message: 'ma, please transfer me money. I only have 7 baht huhu thanks.',
          time: '3:45 PM',
          imageUrl: 'assets/images/mum.jpg',
          onTap: () {},
        ),
        ChatItem(
          name: 'Kriza Claire Canasio',
          message: 'What time will Ajarn Tongpool start class today?',
          time: '12:25 PM',
          imageUrl: 'assets/images/kriza.jpg',
          onTap: () {},
        ),
        ChatItem(
          name: 'Win La Pyae',
          message: 'I will go and meet Sky after class so I cant come to eat Teenoi with you guys maybe next time sorry.',
          time: '7:17 AM',
          imageUrl: 'assets/images/moon.png',
          onTap: () {},
        ),
        ChatItem(
          name: 'Tongpool Heeptaisong',
          message: 'Ok, I will give you full score for this project',
          time: '5:40 AM',
          imageUrl: 'assets/images/tongpool.jpg',
          onTap: () {},
        ),
      ],
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String imageUrl;
  final VoidCallback onTap;

  const ChatItem({
    Key? key,
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(name: name, message: message),
          ),
        );
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Colors.grey[700],
          backgroundImage: AssetImage(imageUrl),
        ),
        title: Text(
          name,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          message,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: Text(
          time,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
