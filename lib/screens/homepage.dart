import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtsk/constants/colors.dart';
import 'package:mtsk/init/generated/locale_keys.g.dart';
import 'package:mtsk/provider/languageprovider.dart';
import 'package:mtsk/screens/secondpage.dart';
import 'package:mtsk/widgets/drawer/drawerwidget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return Consumer<LanguageNotifier>(builder: (context, lang, widget) {
      return Scaffold(
        drawer: const DrawerWidget(),
        key: _key,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  stops: const [
                    0.1,
                    0.8,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    secondaryColor,
                    thirdColor,
                  ],
                )),
                padding: EdgeInsets.only(
                    top: size.height * 0.05, left: 10, right: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /* Flexible(
                    flex: 3,
                    child: logoWidget(),
                  ), */
                    Flexible(
                      flex: 6,
                      child: menuWidet(),
                    ),
                    Flexible(
                      flex: 3,
                      child: qrWidget(),
                    ),
                    Flexible(
                      flex: 2,
                      child: altmenuWidget(),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height: size.height * 0.57),
                  GestureDetector(
                    onTap: () {
                      _key.currentState!.openDrawer();
                    },
                    child: Container(
                      height: size.width * 0.13,
                      width: size.width * 0.08,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget logoWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        child: Image.asset("assets/images/mtsklogo.png"),
      ),
    );
  }

  Widget menuWidet() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ustMenuItem(() {
                  searchDialog(context);
                }, LocaleKeys.home_page_mainitem_1.tr(),
                    FontAwesomeIcons.search, Colors.blue),
                ustMenuItem(() {
                  pageRouteMethod("https://mtsk.com.tr/isaretler");
                }, LocaleKeys.home_page_mainitem_2.tr(),
                    FontAwesomeIcons.exclamationTriangle, Colors.red),
                ustMenuItem(() {
                  pageRouteMethod("https://mtsk.com.tr/soru-bankasi");
                }, LocaleKeys.home_page_mainitem_3.tr(),
                    FontAwesomeIcons.questionCircle, Colors.green),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ustMenuItem(() {
                  pageRouteMethod("https://mtsk.com.tr/arac-teknigi-dersi");
                }, LocaleKeys.home_page_mainitem_4.tr(),
                    FontAwesomeIcons.wrench, Colors.brown),
                ustMenuItem(() {
                  pageRouteMethod("https://mtsk.com.tr/direksiyon-egitimi");
                }, LocaleKeys.home_page_mainitem_5.tr(),
                    FontAwesomeIcons.carSide, Colors.deepPurple),
                ustMenuItem(() {
                  pageRouteMethod("https://mtsk.com.tr/genel-bilgiler");
                }, LocaleKeys.home_page_mainitem_6.tr(), FontAwesomeIcons.info,
                    Colors.cyan),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ustMenuItem(() {
                  pageRouteMethod("https://mtsk.com.tr/ilk-yardim-dersi");
                }, LocaleKeys.home_page_mainitem_7.tr(),
                    FontAwesomeIcons.briefcaseMedical, Colors.red),
                ustMenuItem(() {
                  pageRouteMethod("https://mtsk.com.tr/trafik-adabi-dersi");
                }, LocaleKeys.home_page_mainitem_8.tr(),
                    FontAwesomeIcons.trafficLight, Colors.green),
                ustMenuItem(() {
                  pageRouteMethod("https://mtsk.com.tr/trafik-ve-cevre-dersi");
                }, LocaleKeys.home_page_mainitem_9.tr(), FontAwesomeIcons.road,
                    Colors.indigo),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget qrWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            qrItem(() {
              scanBarcodeNormal();
            }, LocaleKeys.home_page_read_qr.tr(), FontAwesomeIcons.qrcode,
                Colors.black),
            qrItem(() {
              showAlertDialog(context);
            }, LocaleKeys.home_page_write_qr.tr(), FontAwesomeIcons.pencilAlt,
                Colors.black),
          ],
        ),
      ),
    );
  }

  Widget altmenuWidget() {
    return Container(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            altMenuItem(() {
              pageRouteMethod("https://mtsk.com.tr");
            }, LocaleKeys.home_page_home_screen.tr(), FontAwesomeIcons.home,
                Colors.grey.shade700),
            altMenuItem(() {
              pageRouteMethod("https://mtsk.com.tr/hakkimizda");
            }, LocaleKeys.home_page_info.tr(), FontAwesomeIcons.info,
                Colors.grey.shade700),
            altMenuItem(() {
              pageRouteMethod("https://mtsk.com.tr/iletisim");
            }, LocaleKeys.home_page_info.tr(), FontAwesomeIcons.phone,
                Colors.grey.shade700),
            altMenuItem(() {
              SystemNavigator.pop();
            }, LocaleKeys.home_page_exit_app.tr(), FontAwesomeIcons.powerOff,
                Colors.grey.shade700),
          ],
        ),
      ),
    );
  }

  Widget ustMenuItem(
      Function()? onPressed, String text, IconData icon, Color color) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.25,
      width: size.width * 0.25,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              color: color,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: AutoSizeText(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                wrapWords: false,
                textAlign: TextAlign.center,
                maxLines: 2,
                maxFontSize: 15,
                minFontSize: 8,
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white, // background
          onPrimary: Colors.white, // foreground
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 15,
        ),
      ),
    );
  }

  Widget qrItem(
      Function()? onPressed, String text, IconData icon, Color color) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.34,
      width: size.width * 0.34,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              color: color,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: AutoSizeText(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                maxFontSize: 18,
                minFontSize: 12,
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white, // background
          onPrimary: Colors.white, // foreground
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 15,
        ),
      ),
    );
  }

  Widget altMenuItem(
      Function()? onPressed, String text, IconData icon, Color color) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.22,
      width: size.width * 0.22,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: onPressed,
            child: FaIcon(
              icon,
              color: color,
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white, // background
              onPrimary: Colors.white, // foreground
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: AutoSizeText(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              wrapWords: false,
              maxLines: 1,
              maxFontSize: 15,
              minFontSize: 8,
            ),
          ),
        ],
      ),
    );
  }

  String? videourl;
  String scanBarcode = 'Unknown';
  String barcodeScanRes = "";
  Future<void> scanBarcodeNormal() async {
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'OK', true, ScanMode.BARCODE);
      barcodeScanRes = "https://mtsk.com.tr/makale/$barcodeScanRes";
      print(barcodeScanRes);
      pageRouteMethod(barcodeScanRes);
    } on PlatformException {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("!!!!"),
      ));
    }
    if (!mounted) return;
  }

  showAlertDialog(BuildContext context) {
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
                                pageRouteMethod(url);
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

  searchDialog(BuildContext context) {
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
                                url = "https://mtsk.com.tr/?source=kb&s=$url";
                                Navigator.pop(context);
                                pageRouteMethod(url);
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Lütfen bir değer giriniz!"),
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

  pageRouteMethod(String url) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SecondPage(
                  pageRoute: url,
                )));
  }
}
