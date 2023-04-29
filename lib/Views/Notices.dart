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
        color: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
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

                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SingleChildScrollView(
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                  height: 50,
                                                  child: Text(
                                                    notifications[index]
                                                        ['notification'],
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  )),
                                              Container(
                                                  child: Text(notifications[index]
                                                      ['desc']))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [BoxShadow(
                          color: Colors.grey.shade900.withOpacity(0.06), //color of shadow
                          spreadRadius: 2, //spread radius
                          blurRadius: 2, // blur radius
                          offset: Offset(0, 3),
                        ),],
                        color: Colors.black12,
                      ),
                      child: ListTile(
                        title: Text(notifications[index]['notification'],style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                        subtitle: Text(notifications[index]['date'].toString()),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
