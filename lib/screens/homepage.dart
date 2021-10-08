import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtsk/constants/colors.dart';
import 'package:mtsk/widgets/drawer/drawerwidget.dart';

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
      body: Container(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ustMenuItem(() {}, "Arama Motoru", FontAwesomeIcons.search,
                    Colors.blue),
                ustMenuItem(() {}, "Trafik İşaretleri ve Levhalar",
                    FontAwesomeIcons.exclamationTriangle, Colors.red),
                ustMenuItem(() {}, "Soru Bankası",
                    FontAwesomeIcons.questionCircle, Colors.green),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ustMenuItem(() {}, "Araç Tekniği Dersi", FontAwesomeIcons.wrench,
                    Colors.brown),
                ustMenuItem(() {}, "Direksiyon Eğitimi",
                    FontAwesomeIcons.carSide, Colors.deepPurple),
                ustMenuItem(() {}, "Genel Bilgiler", FontAwesomeIcons.info,
                    Colors.cyan),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ustMenuItem(() {}, "İlk Yardım Dersi",
                    FontAwesomeIcons.briefcaseMedical, Colors.red),
                ustMenuItem(() {}, "Trafik Adabı Dersi",
                    FontAwesomeIcons.trafficLight, Colors.green),
                ustMenuItem(() {}, "Trafik ve Çevre Dersi",
                    FontAwesomeIcons.road, Colors.indigo),
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
            qrItem(() {}, "QR Okut", FontAwesomeIcons.qrcode, Colors.black),
            qrItem(() {}, "QR Yaz", FontAwesomeIcons.pencilAlt, Colors.black),
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
            altMenuItem(() {}, "Ana Sayfa", FontAwesomeIcons.home,
                Colors.grey.shade700),
            altMenuItem(() {}, "Hakkımızda", FontAwesomeIcons.info,
                Colors.grey.shade700),
            altMenuItem(() {}, "İletişim", FontAwesomeIcons.phone,
                Colors.grey.shade700),
            altMenuItem(() {}, "Çıkış", FontAwesomeIcons.powerOff,
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
                color: Colors.black,
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
}
