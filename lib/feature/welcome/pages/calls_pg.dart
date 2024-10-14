import 'package:flutter/material.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({super.key});

  @override
  _CallsPageState createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111B21), // Set the background color to dark
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Favourites',
                  style: TextStyle(
                    fontSize: 14, // Reduced font size
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle the tap event (make it clickable)
                    print("More button clicked!"); // You can replace this with any functionality
                  },
                  child: const Text(
                    'More',
                    style: TextStyle(
                      fontSize: 14, // Reduced font size
                      color: Color(0xFF00A884), // Green color for "More"
                    ),
                  ),
                ),
              ],
            ),
          ),
          // No Divider here
          Expanded(
            child: ListView(
              children: [
                // Call list items
                _buildCallTile("Mary Loi Yves Ricalde", "Outgoing", 'assets/images/maloi.jpg'),
                _buildCallTile("My Beloved Mother", "Outgoing", 'assets/images/mum.jpg'),
                _buildCallTile("My Beloved Mother", "Outgoing", 'assets/images/mum.jpg'),
                _buildCallTile("My Beloved Mother", "Outgoing", 'assets/images/mum.jpg'),
                _buildCallTile("My Beloved Mother", "Outgoing", 'assets/images/mum.jpg'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action when the FAB is pressed
          print("FAB Clicked!");
        },
        backgroundColor: const Color(0xFF00A884), // Set the color to match the image
        child: const Icon(
          Icons.add_call, // Phone with a plus sign
          color: Colors.white, // Icon color
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Position it to the bottom right
    );
  }

  // Method to build a call tile
  Widget _buildCallTile(String name, String status, String imageUrl) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageUrl), // Set the image for the CircleAvatar
        backgroundColor: Colors.grey,
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white), // Set text color to white
      ),
      subtitle: Row(
        children: const [
          Icon(Icons.call_made, color: Color(0xFF00A884)), // Use green color for call icon
          SizedBox(width: 5),
          Text(
            'Outgoing',
            style: TextStyle(color: Colors.grey), // Set subtitle color to grey
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.call, color: Colors.white), // Set icon color to white
            onPressed: () {
              // Call action
            },
          ),
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.white), // Set icon color to white
            onPressed: () {
              // Video call action
            },
          ),
        ],
      ),
    );
  }
}
