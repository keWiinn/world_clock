import 'package:flutter/material.dart';
import 'package:project2/pages/home.dart';
import 'package:project2/pages/loading.dart';
import 'package:project2/pages/choose_location.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    }
));