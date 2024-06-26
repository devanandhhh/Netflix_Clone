import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/main_page/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme:const AppBarTheme(color:Colors.transparent),
          scaffoldBackgroundColor: backgroundColor,
          textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
          colorScheme: const ColorScheme.dark(background: Colors.black)),
      home: ScreenMainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
