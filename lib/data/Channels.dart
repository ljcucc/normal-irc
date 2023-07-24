import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Channel {
  String id = "";
  String disp = "";
}

class Channels extends ChangeNotifier {
  final List<Channel> _channels = [];

  UnmodifiableListView<Channel> get channels => UnmodifiableListView(_channels);

  void fetchChannel() {
    _channels.addAll([]);
    notifyListeners();
  }
}
