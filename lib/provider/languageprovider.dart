import 'package:flutter/material.dart';
import 'package:mtsk/helpers/sharedpref.dart';

class LanguageNotifier with ChangeNotifier {
  String _lowID = "tr";
  Locale _setLanguage = BaseSharedPrefHelper.instance
              .getStringValue("deviceLang") ==
          "tr"
      ? const Locale("tr", "TR")
      : BaseSharedPrefHelper.instance.getStringValue("deviceLang") == "tr"
          ? const Locale("en", "US")
          : BaseSharedPrefHelper.instance.getStringValue("deviceLang") == "de"
              ? const Locale("de", "DE")
              : BaseSharedPrefHelper.instance.getStringValue("deviceLang") ==
                      "ru"
                  ? const Locale("ru", "RU")
                  : const Locale("ar", "SA");
  // ignore: todo
  // TODO::ŞİMDİLİK DEFAULT DİL TR YOLLANIYOR EN SON TELEFONUN DİLİ ALINACAK
  Locale get getLanguage => _setLanguage;
  String get lowID => _lowID;
  setAllLanguage(Locale data, String low) {
    _setLanguage = data;
    _lowID = low;
    notifyListeners();
  }

  int _langStatus = 0;
  int get langStatus => _langStatus;
  setLanguageStatus(int value) {
    _langStatus = value;
    notifyListeners();
  }
}
