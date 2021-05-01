import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as spin;
import 'dart:async';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getInitialData() async
  {
    /*await*/ Timer(
        Duration(seconds: 5),
        () {
            print("This code executes after 5 seconds");
        }
    );
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    super.initState();
    //getInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x8DFFFFFF),
      body: Center(
        child: spin.SpinKitRipple(
          color: Color(0xFFE0BFBF),
          size: 100,
        ),
      ),
    );
  }
}
