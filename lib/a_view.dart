import 'package:flutter/material.dart';

import 'b_view.dart';
import 'notification_center.dart';

//  app初始化
class AView extends StatefulWidget {
  const AView({super.key});

  @override
  State<AView> createState() => _AViewState();
}

class _AViewState extends State<AView> {
  int _anum = 0;
  int _bum = 0;

  @override
  void initState() {
    super.initState();

    NotificationCenter.subscribe(
        channel: 'aa',
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
              _bum++;
            });
          }
        });
  }

  @override
  void dispose() {
    NotificationCenter.unsubscribe(observer: this, channel: 'aa');
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
              '$_bum',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BView();
                  }));
                },
                child: Text(
                  '下一场',
                  style: TextStyle(color: Colors.blue),
                ),
              )),
        ],
      ),
    );
  }
}
