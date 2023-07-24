import 'package:flutter/material.dart';

const exmpaleTopic = '''
floof not required but prefurred | keep it sfw - anything else → ##furrysmut (18+) | not a place for politics || <octav1a> but...nothing is better than "h" | Flits is still feesh and cute | everyone's nice and cute! | bnchs is an amazing cat | Happy Pride! | Flits is *still* feesh
''';

class ChatLogPage extends StatefulWidget {
  const ChatLogPage({super.key});

  @override
  State<ChatLogPage> createState() => _ChatLogPageState();
}

class _ChatLogPageState extends State<ChatLogPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      // width: double.infinity,
      // height: double.infinity,
      padding: EdgeInsets.fromLTRB(40, 32, 32, 16),
      alignment: Alignment.topLeft,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              "## CHAT +6",
              style: textTheme.titleLarge,
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
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.5, color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView(
                children: [
                  for (var i = 0; i < 100; i++)
                    ChatRecord(
                      nickname: "TheCatCollective",
                    )
                ],
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 136,
              alignment: Alignment.topLeft,
              child: Text(
                nickname,
                overflow: TextOverflow.visible,
                style: textTheme.bodyMedium?.copyWith(height: 1),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                "thank you\nyou you you",
                style: textTheme.bodyMedium?.copyWith(height: 1),
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
