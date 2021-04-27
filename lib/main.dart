import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  FlutterLocalNotificationsPlugin localNotifications;

  @override
  void initState() {
    super.initState();
    var androidInitialize = AndroidInitializationSettings('notification');
    var initializationSettings = InitializationSettings(android: androidInitialize);
    localNotifications = FlutterLocalNotificationsPlugin();
    localNotifications.initialize(initializationSettings);
  }

  void showNotification() async{
      var androidDetails = AndroidNotificationDetails("channelId", "Local Notification", "This is the description of the notification ");
      var generalNotification = NotificationDetails(android: androidDetails);
      await localNotifications.show(0, "Local Notification", "The Body of the Notification", generalNotification);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification App'),
        centerTitle: true,
      ),
      body:
        Center(
          child: RaisedButton.icon(
              onPressed:() {
                showNotification();
              },
              icon: Icon(
                  Icons.notifications,
                  color: Colors.grey[200],
              ),
              label: Text(
                  'Tap for Notification',
                  style: TextStyle(
                    color: Colors.grey[200],
                  ),
              ),
              color: Colors.blue[500],
          ),
        )
    );
  }
}


