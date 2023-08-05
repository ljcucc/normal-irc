import 'package:flutter/material.dart';
import 'package:normal_irc/app_style.dart';
import 'package:normal_irc/utils.dart';
import 'package:normal_irc/widgets/custom_context_toolbar.dart';
import 'package:provider/provider.dart';

class AddServerWidget extends StatelessWidget {
  const AddServerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appStyle = Provider.of<AppStyle>(context);
    final color = appStyle.color;

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: color),
        padding: EdgeInsets.all(14),
        child: Text(
          "Add Server",
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium!.copyWith(color: appStyle.bgColor),
        ),
      ),
    );
  }
}

class NewServerForm extends StatelessWidget {
  const NewServerForm({super.key});

  InputField(String label, BuildContext context, {bool obscureText = false}) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final color = Provider.of<AppStyle>(context).color;

    return Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(color: color.withOpacity(0.07)),
        child: CustomInput(
          hint: label,
          obscureText: obscureText,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<AppStyle>(context).color;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          // constraints: const BoxConstraints(maxHeight: 150, minHeight: 40),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              InputField("servername", context),
              InputField("hostname", context),
              InputField("account", context),
              InputField("password", context, obscureText: true),
            ],
          ),
        ),
        AddServerWidget(),
      ],
    );
  }
}

class NewServerPageWidget extends StatelessWidget {
  const NewServerPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<AppStyle>(context).color;

    return Center(
      child: Container(
        padding: EdgeInsets.all(32),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(maxWidth: 400),
          // padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(color: color, width: 3),
          ),
          child: NewServerForm(),
        ),
      ),
    );
  }

  static open(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          final textTheme = Theme.of(context).textTheme;
          final appStyle = Provider.of<AppStyle>(context);
          final color = appStyle.color;

          return Scaffold(
            appBar: AppBar(
              title: Text("Connect to server"),
              titleTextStyle: textTheme.titleSmall,
              iconTheme: IconTheme.of(context).copyWith(color: color),
            ),
            body: NewServerPageWidget(),
          );
        },
      ),
    );
  }
}
