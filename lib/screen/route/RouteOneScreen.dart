import 'package:flutter/material.dart';
import 'package:navigation/layout/MainLayout.dart';
import 'package:navigation/screen/route/RouteTwoScreen.dart';

class RouteOneScreen extends StatelessWidget {
  final int number;

  const RouteOneScreen({required this.number, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Route One',
      children: [
        Text(
          'arguments : ${number.toString()}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: Text(
            'Pop',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RouteTwoScreen(),
                settings: RouteSettings(
                  arguments: 789,
                )
              ),
            );
          },
          child: Text(
            'Push',
          ),
        )
      ],
    );
  }
}
