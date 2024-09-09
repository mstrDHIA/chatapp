import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stream/global_data.dart';

class MessageNetwork{
  FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(String username){
    // return FirebaseFirestore.instance
    //               .collection('messages').where('sender',: [GlobalData.user.username,username]).where('receiver',whereIn: [GlobalData.user.username,username])
    //               .orderBy('sent_time', descending: false)
    //               .snapshots();
                  return FirebaseFirestore.instance
                  .collection('messages').where(Filter.and(Filter.or(Filter('sender',isEqualTo: GlobalData.user.username), Filter('sender',isEqualTo: username)), Filter.or(Filter('receiver',isEqualTo: GlobalData.user.username), Filter('receiver',isEqualTo: username))))
                  .orderBy('sent_time', descending: false)
                  .snapshots();
  }


  deleteMessage(){
    db.collection("messages").doc("o8nVUwEWC23Fo8GWVYgc").delete().then(
      (doc) => print("Document deleted"),
      onError: (e) => print("Error updating document $e"),
    );
  }

   void sendMessage(TextEditingController chatController,context,username) async {
    final text = chatController.text.trim();
    if (text.isNotEmpty) {
      try {
        await FirebaseFirestore.instance.collection('messages').add({
          'message': text,
          'sender':GlobalData.user.username,
          'receiver':username,
          'sent_time': FieldValue.serverTimestamp(),
        });
        chatController.clear();
      } catch (e) {
        print('Error sending message: $e');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Failed to send message. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }

  }
}