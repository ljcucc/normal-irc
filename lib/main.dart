import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:normal_irc/pages/ChatLogPage.dart';
import 'package:normal_irc/pages/ChatNavigationPage.dart';
import 'package:normal_irc/pages/MemberList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final themeData = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
          primaryColorDark: Colors.black,
          backgroundColor: Colors.white,
          accentColor: Colors.black),
      textTheme: GoogleFonts.spaceGroteskTextTheme(textTheme).copyWith(
        titleLarge: GoogleFonts.spaceGrotesk(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          letterSpacing: -1,
        ),
        bodyLarge: GoogleFonts.spaceGrotesk(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          letterSpacing: -2,
        ),
        bodyMedium: GoogleFonts.spaceGrotesk(
          fontSize: 16,
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: GoogleFonts.spaceGrotesk(
          fontSize: 12,
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
        ),
      ),
      useMaterial3: true,
    );

    return MaterialApp(
      title: 'Normal IRC',
      theme: themeData,
      home: const MyHomePage(title: '## CHAT'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return LayoutBuilder(builder: (context, constraints) {
        var count = 1;
        // layout based on screen size ( if landscape )
        if (constraints.maxWidth < 750) {
          count = 1;
        } else if (constraints.maxWidth < 1200) {
          count = 2;
        } else {
          count = 3;
        }
        // overwrite layout based on orientation
        if (orientation == Orientation.portrait) {
          count = 1;
        }

        const splitLine = BoxDecoration(
          border: Border(left: BorderSide(width: 1.5, color: Colors.black26)),
        );

        var layouts = [
          Flexible(
            flex: 20,
            child: Container(
              constraints: count == 1
                  ? null
                  : BoxConstraints(maxWidth: 400, minWidth: 100),
              child: ChatNavigationPage(),
            ),
          ),
          Flexible(
            flex: 45,
            child: Container(
              // decoration: splitLine,
              child: ChatLogPage(),
            ),
          ),
          Flexible(
            flex: 15,
            child: Container(
              constraints: BoxConstraints(maxWidth: 400, minWidth: 333),
              // decoration: splitLine,
              child: MemberListPage(),
            ),
          )
        ];
        return Scaffold(
          body: Container(
            child: Row(
              children: layouts.sublist(0, count),
            ),
          ),
        );
      });
    });
  }
}
