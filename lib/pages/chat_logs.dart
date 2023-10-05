import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_native_text_input/flutter_native_text_input.dart';
import 'package:normal_irc/app_style.dart';
import 'package:normal_irc/main.dart';
import 'package:normal_irc/utils.dart';
import 'package:normal_irc/widgets/custom_context_toolbar.dart';
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
      padding: EdgeInsets.fromLTRB(32, 32, 32, 16),
      alignment: Alignment.topLeft,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChatHeaderWidget(),
          Expanded(
            child: Container(
              // padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     width: 2.5,
              //     color: color,
              //   ),
              //   borderRadius: BorderRadius.circular(20),
              // ),
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
          ChatInput(),
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
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "## CHAT",
                style: textTheme.bodyLarge!
                    .copyWith(backgroundColor: color, color: appStyle.bgColor),
                textAlign: TextAlign.left,
              ),
              Text(
                "mode: nvq",
                style: textTheme.bodySmall,
                textAlign: TextAlign.left,
              )
            ],
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 16),
              alignment: Alignment.centerRight,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 200, minWidth: 50),
                // padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Text(
                  exmpaleTopic,
                  style: textTheme.bodySmall?.copyWith(height: 1),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
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
              style: textTheme.bodySmall
                  ?.copyWith(height: 1, fontWeight: FontWeight.w300),
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
      // bottomNavigationBar: BottomNavigationBar(
      //   unselectedItemColor: color,
      //   selectedItemColor: color,
      //   currentIndex: 1,
      //   elevation: 0,
      //   onTap: (value) {
      //     switch (value) {
      //       case 0:
      //         Navigator.pop(context);
      //         break;
      //     }
      //   },
      //   items: [
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.arrow_back),
      //       label: "Back",
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.home_outlined),
      //       label: "Channels",
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.person_outline),
      //       label: "Members",
      //     )
      //   ],
      // ),
    );
  }
}

class ChatInput extends StatelessWidget {
  const ChatInput({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<AppStyle>(context).color;
    final textTheme = Theme.of(context).textTheme;

    return Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          // border: Border.all(
          //   color: color,
          //   width: 2.5,
          // ),
          // borderRadius: BorderRadius.circular(100),
        ),
        child: CustomInput(hint: 'Enter after you double check'));
  }
}
