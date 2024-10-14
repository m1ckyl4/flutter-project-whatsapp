import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key); // Add const constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF111B21), // Background color to match Updates page
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Placeholder for the custom icon or image
            Container(
              height: 150,
              child: Image.asset(
                'assets/images/community_icon.png', // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Stay connected with a community',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Communities bring members together in topic-based groups, '
              'and make it easy to get admin announcements. Any community '
              'you’re added to will appear here.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                // Action for example communities
              },
              child: Row(
                mainAxisSize: MainAxisSize.min, // Makes row take only as much space as needed
                children: const [
                  Text(
                    'See example communities',
                    style: TextStyle(
                      fontSize: 14, // Slightly smaller font size
                      color: Color(0xFF00A884), // Same color as the button
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5), // Space between text and icon
                  Icon(
                    Icons.chevron_right, // Arrow icon
                    color: Color(0xFF00A884), // Same color as the button
                    size: 18, // Adjust icon size to fit well with text
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Action to start a new community
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00A884), // Same as navbar button color
                minimumSize: const Size(double.infinity, 50), // Full-width button
              ),
              child: const Text(
                'Start your community',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Changed text color to white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
