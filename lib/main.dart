import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:normal_irc/app_style.dart';
import 'package:normal_irc/data/IRCClient.dart';
import 'package:normal_irc/pages/chat_logs.dart';
import 'package:normal_irc/pages/navigation_views.dart';
import 'package:normal_irc/pages/member_list.dart';
import 'package:normal_irc/pages/server_list.dart';
import 'package:normal_irc/pages/welcome_screen.dart';
import 'package:normal_irc/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<IRCClient>(create: (_) => IRCClient()),
        ChangeNotifierProvider<AppStyle>(create: (_) => AppStyle()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ThemeData initThemeData(BuildContext context) {
    AppStyle appStyle = Provider.of<AppStyle>(context);

    /// modify textTheme based on appTheme
    final textTheme = Theme.of(context).textTheme;

    // get current color and if color not exists
    var color = appStyle.color;
    // var bgColor = Color.fromARGB(255, 31, 25, 18);
    var bgColor = appStyle.bgColor;
    // color = appStyle.nullableColor ?? Color.fromARGB(255, 255, 0, 0);

    // custom textTheme from GoogleFont
    var customTextTheme = textTheme.copyWith(
      titleLarge: textTheme.titleLarge!.copyWith(
        fontSize: 48,
        fontWeight: FontWeight.w500,
        letterSpacing: -1,
        color: color,
      ),
      titleMedium: textTheme.titleMedium!.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        letterSpacing: -1,
        color: color,
      ),
      titleSmall: textTheme.titleMedium!.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      bodyLarge: textTheme.titleMedium!.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: -2,
        color: color,
      ),
      bodyMedium: textTheme.bodyMedium!.copyWith(
        fontSize: 16,
        letterSpacing: 0,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      bodySmall: textTheme.bodySmall!.copyWith(
        fontSize: 14,
        letterSpacing: 0,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );

    // Apply textTheme and color on themeData
    var themeData = ThemeData(
      // primarySwatch: getMaterialColor(color.value),
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
      textTheme: customTextTheme,
      tooltipTheme: TooltipThemeData(
        textStyle: textTheme.bodySmall!.copyWith(color: appStyle.bgColor),
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
    return Consumer<AppStyle>(builder: (buildecontext, provider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Normal IRC',
        theme: themeData,
        home: const MyHomePage(),
      );
    });
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
    if (inited) return const HomeLayout();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
      ),
    );
  }
}

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  List<Widget> get layouts => [
        Flexible(
          flex: 20,
          child: Container(
            child: ChatNavigationPage(),
          ),
        ),
        Flexible(
          flex: 40,
          child: Container(
            child: ChatLogPageWidget(),
          ),
        ),
        Flexible(
          flex: 20,
          child: Container(
            constraints: BoxConstraints(maxWidth: 400, minWidth: 333),
            child: MemberListPage(),
          ),
        ),
      ];

  Widget UI(int layoutInt) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          // children: layouts,
          children: layouts.sublist(0, layoutInt),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      int layoutInt = getLayoutInt(context);
      return UI(layoutInt);
    });
  }
}
