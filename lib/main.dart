import 'package:flutter/material.dart';
import 'package:normal_irc/app_style.dart';
import 'package:normal_irc/home_layout.dart';
import 'package:normal_irc/pages/welcome_screen.dart';
import 'package:normal_irc/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData initThemeData(BuildContext context) {
    /// modify textTheme based on appTheme
    final textTheme = Theme.of(context).textTheme;

    // get current color and if color not exists
    final color = Color.fromARGB(255, 0, 0, 0);
    final bgColor = Color.fromARGB(255, 255, 255, 255);

    // Apply textTheme and color on themeData
    final themeData = ThemeData(
      splashFactory: NoSplash.splashFactory,
      primaryColor: color,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: color,
        selectionColor: color.withAlpha(100),
        selectionHandleColor: color,
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primaryColorDark: color,
        backgroundColor: bgColor,
        accentColor: Colors.black,
        primarySwatch: getMaterialColor(color),
      ),
      appBarTheme: AppBarTheme(backgroundColor: bgColor),
      tooltipTheme: TooltipThemeData(
        textStyle: textTheme.bodySmall!.copyWith(color: bgColor),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: color,
        border: InputBorder.none,
        hintStyle: textTheme.bodyMedium,
        labelStyle: textTheme.bodyMedium,
      ),
      useMaterial3: true,
    );

    return themeData;
  }

  @override
  Widget build(BuildContext context) {
    var themeData = initThemeData(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Normal IRC',
      theme: themeData,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var inited = false;

  Future<bool> isFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool("first_time") ?? false;
    return firstTime;
  }

  Future openWelcomeScreen() async {
    if (!await isFirstTime()) {
      setState(() {
        inited = true;
      });
      return;
    }
    // Future.delayed(Duration(seconds: 1), () => WelcomeScreen.open(context));
    WelcomeScreen.open(context);
  }

  @override
  void initState() {
    super.initState();
    openWelcomeScreen().then((value) => print("welcome!")).catchError(print);
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    openWelcomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const HomeLayout();
    // if (inited) return const HomeLayout();
    // return Scaffold(
    //   body: Container(
    //     decoration: BoxDecoration(color: Colors.white),
    //   ),
    // );
  }
}
