import 'package:irc/client.dart';

void connect() {
  var config = Configuration(
    host: "irc.ljcu.cc",
    port: 5023,
  );
  var client = new Client(config);
}
