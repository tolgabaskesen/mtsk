import 'package:flutter/material.dart';
import 'package:mtsk/constants/colors.dart';

class DrawerButton extends StatefulWidget {
  final String buttonText;
  final Function()? buttonFunction;
  final IconData buttonIcon;
  const DrawerButton(
      {Key? key,
      required this.buttonText,
      required this.buttonFunction,
      required this.buttonIcon})
      : super(key: key);

  @override
  _DrawerButtonState createState() => _DrawerButtonState();
}

class _DrawerButtonState extends State<DrawerButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.5,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: secondaryColor, // background
              onPrimary: Colors.white, // foreground
            ),
            onPressed: widget.buttonFunction,
            child: Row(
              children: [
                Icon(widget.buttonIcon),
                SizedBox(width: size.width * 0.1),
                Text(widget.buttonText),
              ],
            )));
  }
}
