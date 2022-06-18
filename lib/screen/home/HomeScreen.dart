import 'package:flutter/material.dart';
import 'package:navigation/layout/MainLayout.dart';
import 'package:navigation/screen/route/RouteOneScreen.dart';
import 'package:navigation/screen/route/RouteThreeScreen.dart';
import 'package:navigation/screen/route/RouteTwoScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Home Screen',
      children: [
        for (int i=1; i<=3; i++) ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  Widget routeWidget;
                  switch (i) {
                    case 1:
                      routeWidget = RouteOneScreen();
                      break;
                    case 2:
                      routeWidget = RouteTwoScreen();
                      break;
                    case 3:
                      routeWidget = RouteThreeScreen();
                      break;
                    default:
                      throw new Exception("Bad Request");
                  }

                  return routeWidget;
                },
              ),
            );
          },
          child: Text(
            'Route ${i}',
          ),
        ),
      ],
    );
  }
}
