import 'package:flutter/material.dart';
import 'package:stream/network.dart/message_network.dart';

class MessageBottomBar extends StatelessWidget {
  const MessageBottomBar({
    super.key,
    required this.width,
    required this.chatController,
    required this.messageNetwork, required this.username,
  });
  final String username;
  final double? width;
  final MessageNetwork messageNetwork;
  final TextEditingController chatController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: width!*0.8,
              child: TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                ),
                controller: chatController,
              ),
            ),
            ElevatedButton(onPressed: (){
              // messageNetwork.deleteMessage();
              messageNetwork.sendMessage(chatController, context,username);
            }, child: const Text('Send'))
          ],
        ),
      ),
    );
  }
}