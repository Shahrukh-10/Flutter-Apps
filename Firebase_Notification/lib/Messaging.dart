import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notification/messages_stored.dart';

class Messaging extends StatefulWidget {
  @override
  _MessagingState createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  List<Messages> messages = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage : $message');
        final notification = message['notification'];
        setState(() {
          messages.add(Messages(
              title: notification['title'], body: notification['body']));
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch : $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume : $message');
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Will Display Here'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(messages[index].title),
            subtitle: Text(messages[index].body),
          );
        },
      ),
    );
  }
}
