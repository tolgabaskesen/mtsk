import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:mtsk/constants/colors.dart';
import 'package:mtsk/init/generated/locale_keys.g.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SecondPage extends StatefulWidget {
  final String pageRoute;
  const SecondPage({Key? key, required this.pageRoute}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.second_page_go_back.tr()),
        backgroundColor: secondaryColor,
      ),
      body: WebView(
        initialUrl: widget.pageRoute,
        onWebResourceError: (e) {
          showAlertDialog(context);
        },
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text(
        LocaleKeys.second_page_ok.tr(),
        style: const TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        "!!!!",
        style: TextStyle(color: Colors.white),
      ),
      content: Text(
        LocaleKeys.second_page_website_error.tr(),
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade800,
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
