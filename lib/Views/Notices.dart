import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<dynamic> notifications = [];

  Future<void> _fetchNotifications() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.5:8800/hr'));
      final responseData = json.decode(response.body);
      print(responseData);
      setState(() {
        notifications = responseData;
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('Notice Board   ( දැන්වීම් පුවරුව )'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Scaffold(
                            appBar: AppBar(
                              backgroundColor: Colors.black54,
                              title: Text('Notice    ( දැනුම්දීම )'),
                            ),
                            body: SafeArea(
                              child: Container(
                                child:
                                    Text(notifications[index]['notification']),
                              ),
                            ),
                          )),
                );
              },
              child: ListTile(
                title: Text(notifications[index]['notification']),
                subtitle: Text(notifications[index]['date'].toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
