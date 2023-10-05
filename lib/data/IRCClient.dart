import 'package:flutter/material.dart';
import 'package:irc/client.dart';

class IRCClient extends ChangeNotifier {
  Configuration? config;
  Client? client;

  String selectedChannel = "";

  IRCClient();

  void setup(Configuration c) async {
    config = c;
    client = Client(config!);
    await client!.connect();
    client!.onLineReceive.listen(_onLineReceive);
  }

  void selectChannel(String s) {}

  List<String> get channelList {
    var result = client?.channels.keys.map((e) => e ?? "").toList() ??
        // [];
        ["#furry", "#libera", "#znc"];
    // if (result.length == 0) result = ["No list found"];
    return result;
  }

  void _onLineReceive(LineReceiveEvent lre) {
    // lre.line();
  }
}

void connect() {
  var config = Configuration();
  var client = new Client(config);
}
