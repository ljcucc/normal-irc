import 'package:flutter/material.dart';
import 'package:normal_irc/app_style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreenWidget extends StatelessWidget {
  const WelcomeScreenWidget({super.key});

  pageOne(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Text(
                "Welcome!",
                style: textTheme.titleLarge!.copyWith(fontSize: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        pageOne(context),
        Text("2"),
        Text("3"),
      ],
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static open(context) {
    print("Welcome!");
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return WelcomeScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = Provider.of<AppStyle>(context).color;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        // title: Text("Welcome"),
        // titleTextStyle: textTheme.titleMedium,
        // iconTheme: IconTheme.of(context).copyWith(color: color),
      ),
      body: WelcomeScreenWidget(),
    );
  }
}
