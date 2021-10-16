import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtsk/constants/colors.dart';
import 'package:mtsk/init/generated/locale_keys.g.dart';
import 'package:mtsk/provider/languageprovider.dart';
import 'package:mtsk/screens/homepage.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SecondPage extends StatefulWidget {
  final String pageRoute;
  final String pageType;
  const SecondPage({Key? key, required this.pageRoute, required this.pageType})
      : super(key: key);

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
        actions: [
          (widget.pageType != "normal")
              ? Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        exitMethod(widget.pageType);
                      },
                      child: const FaIcon(FontAwesomeIcons.syncAlt),
                    ),
                  ),
                )
              : Container()
        ],
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

  exitMethod(String type) {
    if (type == "normal") {
    } else if (type == "read") {
      scanBarcodeNormal(type);
    } else {
      showWriteDialog(context);
    }
  }

  String? videourl;
  String scanBarcode = 'Unknown';
  String barcodeScanRes = "";
  Future<void> scanBarcodeNormal(String type) async {
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666',
          LocaleKeys.language_screen_cancel.tr(), true, ScanMode.BARCODE);
      print(barcodeScanRes);
      if (barcodeScanRes != "-1" && barcodeScanRes != "") {
        barcodeScanRes = "https://mtsk.com.tr/makale/$barcodeScanRes";
        Navigator.pop(context);
        pageRouteMethod(barcodeScanRes, type);
      }
    } on PlatformException {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("!!!!"),
      ));
    }
    if (!mounted) return;
  }

  pageRouteMethod(String url, String type) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SecondPage(
                  pageRoute: url,
                  pageType: type,
                )));
  }

  showWriteDialog(BuildContext context) {
    var langProvider = Provider.of<LanguageNotifier>(context, listen: false);
    String url = "";
    Size size = MediaQuery.of(context).size;
    showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
              contentPadding: const EdgeInsets.all(16.0),
              content: Container(
                height: size.height * 0.13,
                width: size.width * 0.7,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        decoration: const InputDecoration(),
                        onChanged: (value) => url = value,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0XFF217eaa), // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {
                              if (url != "") {
                                url = "https://mtsk.com.tr/makale/$url";
                                Navigator.pop(context);
                                Navigator.pop(context);
                                pageRouteMethod(url, "write");
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      LocaleKeys.home_page_please_enter.tr()),
                                ));
                              }
                            },
                            child:
                                AutoSizeText(LocaleKeys.second_page_ok.tr())),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0XFF217eaa), // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: AutoSizeText(
                                LocaleKeys.language_screen_cancel.tr()))
                      ],
                    )
                  ],
                ),
              ));
        });
  }
}
