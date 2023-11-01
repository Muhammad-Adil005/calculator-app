import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String? text;
  final int filColor;
  final int txtColor;
  final double txtSize;
  final Function callback;

  const CalculatorButton({
    Key? key,
    this.text,
    this.filColor = 0xFFFFFFFF,
    this.txtColor = 0xFFFFFFFF,
    this.txtSize = 28,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        //width: 65.w,
        height: 60.h,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(filColor),
            foregroundColor: Color(txtColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          onPressed: () {
            callback(text);
          },
          child: Text(
            text.toString(),
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: txtSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
