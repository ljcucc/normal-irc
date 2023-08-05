import 'package:flutter/material.dart';
import 'package:normal_irc/app_style.dart';
import 'package:provider/provider.dart';

class ClickableTextLink extends StatefulWidget {
  const ClickableTextLink(this.text,
      {super.key, required this.onClick, this.style});

  final String text;
  final VoidCallback onClick;
  final TextStyle? style;

  @override
  State<ClickableTextLink> createState() => _ClickableTextLinkState();
}

class _ClickableTextLinkState extends State<ClickableTextLink> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    Color color = Provider.of<AppStyle>(context).color;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => setState(() {
        onHover = true;
      }),
      onExit: (event) => setState(() {
        onHover = false;
      }),
      child: GestureDetector(
        onTap: widget.onClick,
        child: Text(
          widget.text,
          style: (widget.style ?? Theme.of(context).textTheme.bodyMedium)!
              .copyWith(decoration: onHover ? TextDecoration.underline : null),
        ),
      ),
    );
  }
}
