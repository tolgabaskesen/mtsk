import 'package:flutter/material.dart';
import 'package:mtsk/constants/colors.dart';
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
        title: const Text("Geri Dön"),
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
      child: const Text(
        "Tamam",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text(
        "HATA",
        style: TextStyle(color: Colors.white),
      ),
      content: const Text(
        "İnternet bağlantınızı kontrol ediniz!",
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
