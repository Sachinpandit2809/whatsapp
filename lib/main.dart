import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/constant/constants.dart';
import 'package:whatsapp/theme_changer.dart';
import 'package:whatsapp/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "FlutterDemi",
          themeMode: themeChanger.themeMode,
          home: HomeScreen(),
          theme: ThemeData(
              appBarTheme: AppBarTheme(backgroundColor: Colors.teal),
              brightness: Brightness.light,
              primarySwatch: Colors.teal,
              textTheme: const TextTheme(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                    fontSize: 20.0,
                    color: Colors.black),
                titleMedium: TextStyle(
                    fontFamily: Bold, fontSize: 17.6, color: Color(0xff25292B)),
                titleSmall: TextStyle(
                    fontFamily: Bold, fontSize: 16.0, color: Color(0xff25292B)),
                labelLarge: TextStyle(
                    fontFamily: Bold, fontSize: 14.0, color: Color(0xff25292B)),
                labelMedium: TextStyle(
                    fontFamily: Regular,
                    fontSize: 12.0,
                    color: Color(0xff25292B)),
                labelSmall: TextStyle(
                    fontFamily: Regular,
                    fontSize: 10.0,
                    color: Color(0xff25292B)),
              ),
              iconTheme: IconThemeData(
                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5))),
          // this is for dark mode :-
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              textTheme: const TextTheme(
                titleLarge: TextStyle(
                    fontFamily: 'Bold', fontSize: 20.0, color: Colors.white),
                titleMedium: TextStyle(
                    fontFamily: Bold, fontSize: 18.0, color: Colors.white),
                titleSmall: TextStyle(
                    fontFamily: Bold, fontSize: 16.0, color: Colors.white),
                labelLarge: TextStyle(
                    fontFamily: Bold, fontSize: 14.0, color: Colors.white),
                labelMedium: TextStyle(
                    fontFamily: Regular, fontSize: 12.0, color: Colors.white),
                labelSmall: TextStyle(
                    fontFamily: Regular, fontSize: 10.0, color: Colors.white),
              ),
              iconTheme: IconThemeData(color: Colors.grey.shade600)),
        );
      }),
    );
  }
}
