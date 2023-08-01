import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:normal_irc/app_style.dart';
import 'package:normal_irc/main.dart';
import 'package:normal_irc/utils.dart';
import 'package:provider/provider.dart';

const exmpaleTopic = '''
floof not required but prefurred | keep it sfw - anything else → ##furrysmut (18+) | not a place for politics || <octav1a> but...nothing is better than "h" | Flits is still feesh and cute | everyone's nice and cute! | bnchs is an amazing cat | Happy Pride! | Flits is *still* feesh
''';

class ChatLogPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appStyle = Provider.of<AppStyle>(context);
    final color = appStyle.color!;

    return Container(
      // width: double.infinity,
      // height: double.infinity,
      padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
      alignment: Alignment.topLeft,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChatHeaderWidget(),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.5,
                  color: color,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView(
                children: [
                  for (var i = 0; i < 100; i++)
                    ChatRecord(
                      nickname: "FluffyChan",
                    )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            decoration: BoxDecoration(
              border: Border.all(
                color: color,
                width: 2.5,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: TextField(
                style: textTheme.bodyMedium,
                decoration: InputDecoration(
                  fillColor: color,
                  border: InputBorder.none,
                  hintText: 'Enter after you double check',
                  hintStyle: textTheme.bodyMedium,
                  labelStyle: textTheme.bodyMedium,
                  enabledBorder: InputBorder.none,
                ),
                cursorColor: color),
          ),
        ],
      ),
    );
  }
}

class ChatHeaderWidget extends StatelessWidget {
  const ChatHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    final appStyle = Provider.of<AppStyle>(context);
    var color = appStyle.color;

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              "## CHAT",
              style: textTheme.titleLarge!
                  .copyWith(backgroundColor: color, color: Colors.white),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Text(
              exmpaleTopic,
              style: textTheme.bodySmall?.copyWith(height: 1),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class ChatRecord extends StatelessWidget {
  const ChatRecord({
    super.key,
    this.nickname = "",
  });

  final String nickname;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () => {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // width: 136,
              alignment: Alignment.topLeft,
              child: Text(
                nickname,
                overflow: TextOverflow.visible,
                style: textTheme.bodyMedium
                    ?.copyWith(height: 1, fontWeight: FontWeight.w700),
              ),
            ),
            // SizedBox(height: 16),
            Text(
              "Hello\nUwU This is a test message...",
              style: textTheme.bodyMedium
                  ?.copyWith(height: 1, fontWeight: FontWeight.w100),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class ChatLogPageScreen extends StatelessWidget {
  const ChatLogPageScreen({super.key});

  static void open(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatLogPageScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appStyle = Provider.of<AppStyle>(context);
    final color = appStyle.color;

    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: NetworkImage("https://s.ljcu.cc/D4Xi"), fit: BoxFit.cover),
        // ),
        child: ChatLogPageWidget(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: color,
        currentIndex: 1,
        elevation: 0,
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.pop(context);
              break;
          }
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: "Back",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Channels",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Members",
          )
        ],
      ),
    );
  }
}
