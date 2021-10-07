import 'package:flutter/material.dart';
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
        children: [
          Container(
            height: size.height * 0.2,
            width: size.width * 0.6,
            decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                )),
            alignment: Alignment.bottomRight,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height * 0.13,
                  width: size.width * 0.35,
                  alignment: Alignment.center,
                  /* child: Image.asset(
                    "assets/images/bvLOGO2.png",
                    fit: BoxFit.fill,
                  ), */
                )),
          ),
          Container(
            height: size.height * 0.75,
            width: size.width * 0.6,
            child: Column(
              children: const [
                LanguageButton(
                    pic: "turkey",
                    lowerID: "tr",
                    upperID: "TR",
                    buttonText: "Türkçe"),
                LanguageButton(
                    pic: "england",
                    lowerID: "en",
                    upperID: "US",
                    buttonText: "English"),
                LanguageButton(
                    pic: "germany",
                    lowerID: "de",
                    upperID: "DE",
                    buttonText: "German"),
                LanguageButton(
                    pic: "arab",
                    lowerID: "ar",
                    upperID: "SA",
                    buttonText: "Arabic"),
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
                color: Colors.grey.shade600,
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
