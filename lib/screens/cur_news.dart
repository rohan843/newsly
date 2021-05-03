import 'package:flutter/material.dart';

class CurNews extends StatefulWidget {
  @override
  _CurNewsState createState() => _CurNewsState();
}

class _CurNewsState extends State<CurNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Text("in current news screen"),
      )
    );
  }
}

