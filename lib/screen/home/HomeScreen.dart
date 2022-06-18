import 'package:flutter/material.dart';
import 'package:navigation/layout/MainLayout.dart';
import 'package:navigation/screen/route/RouteOneScreen.dart';
import 'package:navigation/screen/route/RouteThreeScreen.dart';
import 'package:navigation/screen/route/RouteTwoScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // 시스템에서 뒤로가기를 막고싶은 경우
        // true - pop 가능
        // false - pop 불가능
        // 작업실행
        final canPop = Navigator.of(context).canPop();

        return canPop;
      },
      child: MainLayout(
        title: 'Home Screen',
        children: [
          ElevatedButton(
            onPressed: () {
              print(Navigator.of(context).canPop());
            },
            child: Text(
              'Can Pop',
            ),
          ),
          // MaybePop 더이상 뒤로 돌아갈 수 있는 위젯이 없을 때
          // pop 할 수 없게 막을 수 있음
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).maybePop();
            },
            child: Text(
              'MaybePop',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Pop',
            ),
          ),
          for (int i = 1; i <= 3; i++)
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      Widget routeWidget;
                      switch (i) {
                        case 1:
                          routeWidget = RouteOneScreen(
                            number: 123,
                          );
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

                print(result);
              },
              child: Text(
                'Route ${i}',
              ),
            ),
        ],
      ),
    );
  }
}
