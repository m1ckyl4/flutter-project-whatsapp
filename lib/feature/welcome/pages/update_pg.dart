import 'package:flutter/material.dart';

class UpdatesPage extends StatefulWidget {
  const UpdatesPage({super.key});

  @override
  _UpdatesPageState createState() => _UpdatesPageState();
}

class _UpdatesPageState extends State<UpdatesPage> {
  bool _showStatusPrivacyHint = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111B21),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            '',
            style: TextStyle(color: Colors.white, fontSize: 0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),

          // Status Privacy Hint
          if (_showStatusPrivacyHint) _buildStatusPrivacyHint(),

          const SizedBox(height: 10),

          // Status section
          _buildStatusSection(),

          const SizedBox(height: 20),

          // Channels section
          _buildChannelsSection(),
        ],
      ),
    );
  }

  Widget _buildStatusPrivacyHint() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF263238),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Icon(Icons.security, color: Color(0xFF00A884)),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Use Status to share photos, text, and videos that disappear in 24 hours. ',
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _showStatusPrivacyHint = false;
              });
            },
            child: const Icon(Icons.close, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Status',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                child: const Icon(Icons.person, color: Colors.white),
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor: const Color(0xFF00A884),
                child: const Icon(Icons.add, size: 15, color: Colors.white),
              ),
            ],
          ),
          title: const Text(
            'My status',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            'Tap to add status update',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildChannelsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Channels',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildChannelItem('Real Madrid C.F.', 'assets/images/madrid.jpg'),
            _buildChannelItem('Manchester City', 'assets/images/manchester.png'),
            _buildChannelItem('Liverpool F.C.', 'assets/images/liverpool.jpg'),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF009C6D), // Slightly greener shade
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            minimumSize: const Size(0, 36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Explore more',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,  // Smaller font size
                ),
              ),
              const SizedBox(width: 5), // Add width space here
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChannelItem(String name, String logoPath) {
    return Container(
      width: 120, // Adjusted width for the container
      decoration: BoxDecoration(
        color: const Color(0xFF263238), // Background color for the container
        border: Border.all(color: Colors.white, width: 1), // White border
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      padding: const EdgeInsets.all(8), // Padding inside the container
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight, // Align the check mark at the bottom right
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent, // Make background transparent
                backgroundImage: AssetImage(logoPath),
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00A884),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Follow',
              style: TextStyle(fontSize: 12, color: Colors.white), // Set color to white
            ),
          ),
        ],
      ),
    );
  }
}
