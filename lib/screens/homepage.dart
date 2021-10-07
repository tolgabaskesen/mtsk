import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtsk/constants/colors.dart';

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
      body: Container(
        height: size.height,
        width: size.width,
        color: primaryColor,
        padding: EdgeInsets.all(size.height * 0.05),
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: logoWidget(),
            ),
            Flexible(
              flex: 5,
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
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ustMenuItem(() {}, "Menü", Icons.ac_unit),
                ustMenuItem(() {}, "Menü", Icons.ac_unit),
                ustMenuItem(() {}, "Menü", Icons.ac_unit),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ustMenuItem(() {}, "Menü", Icons.ac_unit),
                ustMenuItem(() {}, "Menü", Icons.ac_unit),
                ustMenuItem(() {}, "Menü", Icons.ac_unit),
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
        color: Colors.yellow,
      ),
    );
  }

  Widget altmenuWidget() {
    return Container(
      color: Colors.red,
    );
  }

  Widget ustMenuItem(Function()? onPressed, String text, IconData icon) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.22,
      width: size.width * 0.22,
      child: ElevatedButton(
        onPressed: onPressed,
        child: AutoSizeText(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 3,
          maxFontSize: 18,
          minFontSize: 12,
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey.shade400, // background
          onPrimary: Colors.white, // foreground
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 15,
        ),
      ),
    );
  }
}
