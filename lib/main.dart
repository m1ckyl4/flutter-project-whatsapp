import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/feature/welcome/pages/welcome_page.dart';
// import 'package:whatsapp_messenger/feature/welcome/welcome_page.dart';

void main() {
  runApp(const WhatsAppMessenger());
}

class WhatsAppMessenger extends StatelessWidget {
  const WhatsAppMessenger ({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Me',
      home: WelcomePage(),
    );
  }
}
