import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patriot/screens/auth_screen.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: () {
        return const MaterialApp(
          home: MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthScreen();
  }
}
