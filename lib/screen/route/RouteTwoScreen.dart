import 'package:flutter/material.dart';
import 'package:navigation/layout/MainLayout.dart';
import 'package:navigation/screen/route/RouteThreeScreen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
      title: 'Route Two',
      children: [
        Text(
          'arguments : ${arguments}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Pop',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/three', arguments: 999);
          },
          child: Text(
            'Push Named',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => RouteThreeScreen(),
              ),
            );
          },
          child: Text(
            'Push Replacement',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/three');
          },
          child: Text(
            'Push ReplacementNamed',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => RouteThreeScreen(),
              ),
              // (route) => false 하면 모든 스크린이 삭제됨
              // true 하면 모두 살림
              // 아래 처럼 하면 HomeScreen 만 살아있음
              (route) => route.settings.name == '/',
            );
          },
          child: Text('Push And Remove Until'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/three',
              // (route) => false 하면 모든 스크린이 삭제됨
              // true 하면 모두 살림
              // 아래 처럼 하면 HomeScreen 만 살아있음
              (route) => route.settings.name == '/',
            );
          },
          child: Text('Push Named And Remove Until'),
        ),
      ],
    );
  }
}
