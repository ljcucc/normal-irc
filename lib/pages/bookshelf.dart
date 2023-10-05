import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookShelfPage extends StatefulWidget {
  const BookShelfPage({super.key});

  @override
  State<BookShelfPage> createState() => _BookShelfPageState();
}

class _BookShelfPageState extends State<BookShelfPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BookSpineWidget(title: "View of a state"),
        BookSpineWidget(title: "View of a state"),
        BookSpineWidget(title: "View of a state"),
      ],
    );
  }
}

class BookSpineWidget extends StatefulWidget {
  const BookSpineWidget({super.key, required this.title});

  final String title;

  @override
  State<BookSpineWidget> createState() => _BookSpineWidgetState();
}

class _BookSpineWidgetState extends State<BookSpineWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 1,
          ),
        ),
      ),
      child: RotatedBox(
        quarterTurns: 1,
        child: ExpansionTile(
          title: Text(widget.title),
          children: [
            RotatedBox(
              quarterTurns: -1,
              child: Container(
                height: double.infinity,
                // width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 1,
                    ),
                  ),
                ),
                child: Text("This is content"),
              ),
            ),
          ],
        ),
      ),
    );
    return RotatedBox(
      quarterTurns: 1,
      child: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(255, 0, 0, 0),
              width: 1,
            ),
          ),
        ),
        child: Text(
          widget.title,
          maxLines: 1,
        ),
      ),
    );
  }
}
