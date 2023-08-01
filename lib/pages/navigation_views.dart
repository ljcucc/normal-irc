import 'package:flutter/material.dart';
import 'package:normal_irc/app_style.dart';
import 'package:normal_irc/data/IRCClient.dart';
import 'package:normal_irc/main.dart';
import 'package:normal_irc/pages/chat_logs.dart';
import 'package:normal_irc/pages/new_server.dart';
import 'package:normal_irc/utils.dart';
import 'package:provider/provider.dart';

import 'package:normal_irc/main.dart';

class ChatNavigationPage extends StatelessWidget {
  get IRCView => const [
        ChatServerTitleWidget(title: "Libera Chat"),
        IRCChannelListWidget(),
      ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appStyle = Provider.of<AppStyle>(context);
    final color = appStyle.color;

    return Material(
      child: Container(
        padding: EdgeInsets.fromLTRB(32, 32, 32, 16),
        child: Column(
          children: IRCView,
        ),
      ),
    );
  }
}

class IRCChannelListWidget extends StatelessWidget {
  const IRCChannelListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          ChannelListWidget(),
          SizedBox(
            height: 16,
          ),
          JoinButtonWidget(),
        ],
      ),
    );
  }
}

class URAlone extends StatelessWidget {
  const URAlone({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appStyle = Provider.of<AppStyle>(context);
    final color = appStyle.color!;

    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 400, maxHeight: 400),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 2,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(color, BlendMode.plus),
                  child: ColorFiltered(
                    colorFilter:
                        ColorFilter.mode(Colors.grey, BlendMode.saturation),
                    child: Image.asset("images/ur_alone.jpg"),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "You found Meowtchi !\n\na lonely guy who can't join any channel because he's a cat. Before you leave, please stay in here a moment with him, to heal his broken heart.",
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium!
                      .copyWith(fontSize: 14, fontStyle: FontStyle.italic),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChannelListWidget extends StatelessWidget {
  const ChannelListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appStyle = Provider.of<AppStyle>(context);

    List<Widget> list = [
      for (var item in Provider.of<IRCClient>(context).channelList)
        InkWell(
          onTap: () {
            if (getLayoutInt(context) == 1) ChatLogPageScreen.open(context);
          }, // Handle your callback
          child: Container(
            // height: 80,
            // height: 44,
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item,
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
    ];

    // if (Provider.of<IRCClient>(context).channelList.length == 0) {
    //   return URAlone();
    // }

    return Expanded(
      child: getLayoutInt(context) == 1
          ? ListWheelScrollView(
              itemExtent: 40,
              diameterRatio: 0.8,
              offAxisFraction: 0.5,
              children: list,
            )
          : ListView(
              padding: EdgeInsets.only(top: 32),
              children: list,
            ),
    );
  }
}

class ChatServerTitleWidget extends StatelessWidget {
  const ChatServerTitleWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      // padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
      child: Text(
        title,
        style: textTheme.titleLarge,
      ),
    );
  }
}

class JoinButtonWidget extends StatelessWidget {
  const JoinButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appStyle = Provider.of<AppStyle>(context);
    final color = appStyle.color;

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const ChatLogPageScreen()),
        // );

        NewServerPageWidget.open(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(24, 14, 24, 14),
        child: Text(
          "Join Channel",
          style: textTheme.bodyMedium?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
