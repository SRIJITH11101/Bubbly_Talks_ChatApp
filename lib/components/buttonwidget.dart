import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String btname;
  final Color colour;
  final Function()? onpressed;
  ButtonWidget(
      {super.key,
      required this.btname,
      required this.colour,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onpressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            btname,
          ),
        ),
      ),
    );
  }
}
