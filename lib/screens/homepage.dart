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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Container(
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
      ),
    );
  }

  Widget logoWidget() {
    Size size = MediaQuery.of(context).size;
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
                }, "Arama Motoru", FontAwesomeIcons.search, Colors.blue),
                ustMenuItem(() {
                  pageRouteMethod("https://mtsk.com.tr/isaretler");
                }, "Trafik İşaretleri ve Levhalar",
                    FontAwesomeIcons.exclamationTriangle, Colors.red),
                ustMenuItem(() {
                  pageRouteMethod("https://mtsk.com.tr/soru-bankasi");
                }, "Soru Bankası", FontAwesomeIcons.questionCircle,
                    Colors.green),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ustMenuItem(() {
                  pageRouteMethod("https://mtsk.com.tr/arac-teknigi-dersi");
                }, "Araç Tekniği Dersi", FontAwesomeIcons.wrench, Colors.brown),
                ustMenuItem(() {
                  pageRouteMethod("https://mtsk.com.tr/direksiyon-egitimi");
                }, "Direksiyon Eğitimi", FontAwesomeIcons.carSide,
                    Colors.deepPurple),
                ustMenuItem(() {
                  pageRouteMethod("https://mtsk.com.tr/genel-bilgiler");
                }, "Genel Bilgiler", FontAwesomeIcons.info, Colors.cyan),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ustMenuItem(() {
                  pageRouteMethod("https://mtsk.com.tr/ilk-yardim-dersi");
                }, "İlk Yardım Dersi", FontAwesomeIcons.briefcaseMedical,
                    Colors.red),
                ustMenuItem(() {
                  pageRouteMethod("https://mtsk.com.tr/trafik-adabi-dersi");
                }, "Trafik Adabı Dersi", FontAwesomeIcons.trafficLight,
                    Colors.green),
                ustMenuItem(() {
                  pageRouteMethod("https://mtsk.com.tr/trafik-ve-cevre-dersi");
                }, "Trafik ve Çevre Dersi", FontAwesomeIcons.road,
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
            }, "QR Okut", FontAwesomeIcons.qrcode, Colors.black),
            qrItem(() {
              showAlertDialog(context);
            }, "QR Yaz", FontAwesomeIcons.pencilAlt, Colors.black),
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
            }, "Ana Sayfa", FontAwesomeIcons.home, Colors.grey.shade700),
            altMenuItem(() {
              pageRouteMethod("https://mtsk.com.tr/hakkimizda");
            }, "Hakkımızda", FontAwesomeIcons.info, Colors.grey.shade700),
            altMenuItem(() {
              pageRouteMethod("https://mtsk.com.tr/iletisim");
            }, "İletişim", FontAwesomeIcons.phone, Colors.grey.shade700),
            altMenuItem(() {
              SystemNavigator.pop();
            }, "Çıkış", FontAwesomeIcons.powerOff, Colors.grey.shade700),
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
                maxLines: 3,
                maxFontSize: 17,
                minFontSize: 10,
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
      height: size.width * 0.20,
      width: size.width * 0.20,
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
              maxLines: 1,
              maxFontSize: 16,
              minFontSize: 10,
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
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      barcodeScanRes = "https://mtsk.com.tr/makale/$barcodeScanRes";
      print(barcodeScanRes);
      pageRouteMethod(barcodeScanRes);
    } on PlatformException {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Lütfen tekrar deneyiniz.."),
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
                                    .showSnackBar(const SnackBar(
                                  content: Text("Lütfen bir değer giriniz!"),
                                ));
                              }
                            },
                            child:
                                AutoSizeText(LocaleKeys.video_player_ok.tr())),
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
                                AutoSizeText(LocaleKeys.video_player_ok.tr())),
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
