import 'package:flutter/material.dart';

import 'notification_center.dart';

class BView extends StatefulWidget {
  const BView({super.key});

  @override
  State<BView> createState() => _BViewState();
}

class _BViewState extends State<BView> {
  int _anum = 0;
  int _bnum = 0;

  @override
  void initState() {
    super.initState();

    NotificationCenter.subscribe(
        channel: 'cc',
        observer: this,
        onNotification: (option) {
          if (mounted) {
            setState(() {
              _anum++;
            });
          }
        });
    NotificationCenter.subscribe(
        channel: 'bb',
        observer: this,
        onNotification: (option) {
          if (mounted) {
            setState(() {
              _bnum++;
            });
          }
        });
  }

  @override
  void dispose() {
    NotificationCenter.unsubscribe(observer: this, channel: 'cc');
    NotificationCenter.unsubscribe(observer: this, channel: 'bb');
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$_anum',
            style: TextStyle(color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '$_bnum',
              style: TextStyle(color: Colors.black),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              '返回',
              style: TextStyle(color: Colors.red),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {
                  NotificationCenter.post(channel: 'aa');
                },
                child: Text(
                  '发送a',
                  style: TextStyle(color: Colors.blue),
                ),
              )),
          GestureDetector(
            onTap: () {
              NotificationCenter.post(channel: 'bb');
            },
            child: Text(
              '发送b',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {
                  NotificationCenter.post(channel: 'cc');
                },
                child: Text(
                  '发送c',
                  style: TextStyle(color: Colors.blue),
                ),
              )),
          GestureDetector(
            onTap: () {
              NotificationCenter.post(channel: 'dd');
            },
            child: Text(
              '发送d',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
