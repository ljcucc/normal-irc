import 'package:flutter/material.dart';
import 'package:normal_irc/pages/ChatLogPage.dart';

class ChatNavigationPage extends StatefulWidget {
  const ChatNavigationPage({super.key});

  @override
  State<ChatNavigationPage> createState() => _ChatNavigationPage();
}

class _ChatNavigationPage extends State<ChatNavigationPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      child: Container(
        padding: EdgeInsets.fromLTRB(32, 32, 32, 16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
              child: Text(
                "Libera Chat",
                style: textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  for (var item in [
                    "# libera",
                    "## furry",
                    "# ubuntu-tw",
                    "# javascript",
                    "## chat",
                    "# znc",
                    "# suckless"
                  ])
                    InkWell(
                      onTap: () {}, // Handle your callback
                      child: Container(
                        // height: 80,
                        height: 44,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item,
                              style: textTheme.bodyMedium,
                              textAlign: TextAlign.left,
                            ),
                            // Container(
                            //   // constraints: BoxConstraints(maxWidth: 300),
                            //   child: Text(
                            //     exmpaleTopic,
                            //     style: textTheme.bodySmall?.copyWith(
                            //       color: Colors.black26,
                            //       height: 1,
                            //     ),
                            //     textAlign: TextAlign.left,
                            //     maxLines: 2,
                            //     overflow: TextOverflow.ellipsis,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                ),
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(24, 14, 24, 14),
                child: Text(
                  "Join Channel",
                  style: textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
