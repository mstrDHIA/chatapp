import 'dart:async';

import 'package:flutter/material.dart';

class StreamWidgetTwo extends StatelessWidget {
 /// Create a StreamController.
 final StreamController<String> controller = StreamController();

  StreamWidgetTwo({super.key});

 @override
 Widget build(BuildContext context) {

   addStreamData();
  
   return MaterialApp(
     home: Scaffold(
       appBar: AppBar(title: const Text('Stream Builder Example')),
       body: StreamBuilder<String>(
         stream: controller.stream,
         builder: (context, snapshot) {
           if (snapshot.connectionState == ConnectionState.active) {
             return Center(
               child: Text(snapshot.data ?? 'No data yet',textScaleFactor: 2,),
             );
           } else {
             return const Center(child: CircularProgressIndicator());
           }
         },
       ),
     ),
   );
 }

 Future<void> addDelayedData(String data) async {
   await Future.delayed(const Duration(seconds: 1));
   controller.add(data);
 }

 Future<void> addStreamData() async {
   /// Add events to the StreamController with a 1-second delay.
   await addDelayedData('Hello');
   await addDelayedData('World');
   await addDelayedData('How');
   await addDelayedData('Are');
   await addDelayedData('You!!');
 }
}