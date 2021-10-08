import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtsk/constants/colors.dart';
import 'package:mtsk/init/generated/locale_keys.g.dart';
import 'package:mtsk/widgets/language/languagebutton.dart';
import 'drawerButton.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      width: size.width * 0.6,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size.height * 0.2,
            width: size.width * 0.6,
            decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                )),
            alignment: Alignment.bottomRight,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: size.height * 0.13,
                    width: size.width * 0.35,
                    alignment: Alignment.bottomRight,
                    child: AutoSizeText(
                      LocaleKeys.language_screen_title.tr(),
                      maxFontSize: 45,
                      wrapWords: false,
                      minFontSize: 25,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ))),
          ),
          Container(
            height: size.height * 0.75,
            width: size.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                LanguageButton(
                    pic: "turkey",
                    lowerID: "tr",
                    upperID: "TR",
                    buttonText: "Türkçe"),
                LanguageButton(
                    pic: "arab",
                    lowerID: "ar",
                    upperID: "SA",
                    buttonText: "Arabic"),
                LanguageButton(
                    pic: "russia",
                    lowerID: "zh",
                    upperID: "ZH",
                    buttonText: "Chinese"),
                LanguageButton(
                    pic: "england",
                    lowerID: "en",
                    upperID: "US",
                    buttonText: "English"),
                LanguageButton(
                    pic: "russia",
                    lowerID: "fa",
                    upperID: "FA",
                    buttonText: "Farsi"),
                LanguageButton(
                    pic: "russia",
                    lowerID: "fr",
                    upperID: "FR",
                    buttonText: "French"),
                LanguageButton(
                    pic: "germany",
                    lowerID: "de",
                    upperID: "DE",
                    buttonText: "German"),
                LanguageButton(
                    pic: "russia",
                    lowerID: "ru",
                    upperID: "RU",
                    buttonText: "Russian"),
              ],
            ),
          ),
          Container(
            height: size.height * 0.05,
            width: size.width * 0.6,
            decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                )),
            alignment: Alignment.center,
            child: const Text(
              "Version: 1.0.0",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
