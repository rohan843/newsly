import 'package:flutter/material.dart';
import 'package:news_app/screens/cur_news.dart';
import 'package:news_app/screens/loading.dart';
import 'package:news_app/screens/opening_screen.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/screens/search.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/loading': (context) => Loading(),
      '/home': (context) => Home(),
      '/cur_news': (context) => CurNews(),
      '/opening_screen': (context) => OpeningScreen(),
      '/search': (context) => Search(),
    },
  ));
}

//TODO: add a privacy policy screen
//TODO: improve the drawer's communicate buttons, include text in button too
