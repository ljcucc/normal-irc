import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:normal_irc/pages/bookshelf.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: const EdgeInsets.all(16),
        child: const BookShelfPage(),
      ),
    );
  }
}
