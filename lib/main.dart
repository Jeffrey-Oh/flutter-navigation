import 'package:flutter/material.dart';
import 'package:navigation/screen/home/HomeScreen.dart';
import 'package:navigation/screen/route/RouteOneScreen.dart';
import 'package:navigation/screen/route/RouteThreeScreen.dart';
import 'package:navigation/screen/route/RouteTwoScreen.dart';

void main() {
  runApp(MaterialApp(
    // home: HomeScreen(),
    initialRoute: '/',
    routes: {
      '/' : (context) => HomeScreen(),
      '/one' : (context) => RouteOneScreen(),
      '/two' : (context) => RouteTwoScreen(),
      '/three' : (context) => RouteThreeScreen(),
    },
  ));
}