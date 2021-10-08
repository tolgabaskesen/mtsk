import 'package:flutter/material.dart';
import 'package:mtsk/helpers/sharedpref.dart';
import 'package:mtsk/provider/languageprovider.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageButton extends StatefulWidget {
  final String buttonText;
  final String lowerID;
  final String upperID;
  final String pic;

  const LanguageButton({
    Key? key,
    required this.buttonText,
    required this.lowerID,
    required this.upperID,
    required this.pic,
  }) : super(key: key);

  @override
  _LanguageButtonState createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var langProvider = Provider.of<LanguageNotifier>(context, listen: false);

    return Container(
        width: size.width * 0.5,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey.shade600, // background
            onPrimary: Colors.white, // foreground
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          onPressed: () async {
            await context.setLocale(Locale(widget.lowerID, widget.upperID));
            await langProvider.setLanguageStatus(1);
            await langProvider.setAllLanguage(
                Locale(widget.lowerID, widget.upperID), widget.lowerID);
            BaseSharedPrefHelper.instance
                .setStringValue("deviceLang", widget.lowerID);
            setState(() {
              context.setLocale(Locale(widget.lowerID, widget.upperID));
              langProvider.setLanguageStatus(1);
              langProvider.setAllLanguage(
                  Locale(widget.lowerID, widget.upperID), widget.lowerID);
              BaseSharedPrefHelper.instance
                  .setStringValue("deviceLang", widget.lowerID);
            });
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Icon(Icons.language),
              SizedBox(width: size.width * 0.1),
              Text(
                widget.buttonText,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
