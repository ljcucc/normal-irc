import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:normal_irc/app_style.dart';
import 'package:provider/provider.dart';

class CustomContextMenuButton extends StatefulWidget {
  final ContextMenuButtonItem button;
  const CustomContextMenuButton({super.key, required this.button});

  @override
  State<CustomContextMenuButton> createState() =>
      _CustomContextMenuButtonState();
}

class _CustomContextMenuButtonState extends State<CustomContextMenuButton> {
  bool onSelect = false;

  @override
  Widget build(BuildContext context) {
    final appStyle = Provider.of<AppStyle>(context);
    final color = appStyle.color;
    final textTheme = Theme.of(context).textTheme;

    return MouseRegion(
      onEnter: (event) {
        setState(() {
          onSelect = true;
        });
      },
      onExit: (event) {
        setState(() {
          onSelect = false;
        });
      },
      child: GestureDetector(
        onTap: widget.button.onPressed,
        child: SizedBox(
          width: 300,
          child: Container(
            padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
            decoration:
                BoxDecoration(color: onSelect ? color : Colors.transparent),
            child: Text(
              CupertinoTextSelectionToolbarButton.getButtonLabel(
                  context, widget.button),
              textAlign: TextAlign.start,
              style: textTheme.bodyMedium!
                  .copyWith(color: onSelect ? appStyle.bgColor : color),
            ),
          ),
        ),
      ),
    );
  }

  static Widget contextMenuBuilder(
      BuildContext context, EditableTextState editableTextState) {
    return CupertinoAdaptiveTextSelectionToolbar(
      anchors: editableTextState.contextMenuAnchors,
      children: editableTextState.contextMenuButtonItems.map((e) {
        return CustomContextMenuButton(button: e);
      }).toList(),
    );
  }
}

class CustomInput extends StatelessWidget {
  const CustomInput({super.key, required this.hint, this.obscureText = false});

  final String hint;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<AppStyle>(context).color;
    final textTheme = Theme.of(context).textTheme;

    // print("default is");
    // print([
    //   TargetPlatform.android,
    //   TargetPlatform.iOS,
    // ].contains(defaultTargetPlatform));

    // final nativeTextField = NativeTextInput();

    return TextFormField(
      style: textTheme.bodyMedium,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: color,
        border: InputBorder.none,
        hintText: hint,
        hintStyle: textTheme.bodyMedium,
        labelStyle: textTheme.bodyMedium,
        enabledBorder: InputBorder.none,
      ),
      cursorColor: color,
      contextMenuBuilder: kIsWeb ||
              [
                TargetPlatform.android,
                TargetPlatform.iOS,
              ].contains(defaultTargetPlatform)
          ? /* default menu*/ (context, e) =>
              AdaptiveTextSelectionToolbar.editableText(
                editableTextState: e,
              )
          : _CustomContextMenuButtonState.contextMenuBuilder,
    );
  }
}
