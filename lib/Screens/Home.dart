import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

import './CalculatorButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _result = '';
  String _expression = '';

  void numClick(String text) {
    if ((_expression.isEmpty ||
            _expression.endsWith('+') ||
            _expression.endsWith('-') ||
            _expression.endsWith('×') ||
            _expression.endsWith('÷') ||
            _expression.endsWith('%')) &&
        (text == '+' ||
            text == '-' ||
            text == '×' ||
            text == '÷' ||
            text == '%')) {
      return; // ignore the input
    }
    if (_result.isNotEmpty &&
        (text == '+' ||
            text == '-' ||
            text == '×' ||
            text == '÷' ||
            text == '%')) {
      setState(() {
        _expression = _result;
      });
    }
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _result = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    try {
      String expression = _expression.replaceAll('×', '*').replaceAll('÷', '/');
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();

      double eval = exp.evaluate(EvaluationType.REAL, cm);

      setState(() {
        _result = expression;
        _expression = eval % 1 == 0 ? eval.toInt().toString() : eval.toString();
      });
    } catch (e) {
      print('Invalid expression: $e');
      setState(() {
        _result = 'Error';
        _expression = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black54,
      backgroundColor: Color(0xff1C1C1C),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Text(
                  _result,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 24.sp,
                      color: Color(0xFF545F61),
                    ),
                  ),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  _expression,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      //fontSize: 48.sp,
                      fontSize: _expression.length > 10 ? 20.sp : 45.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButton(
                  txtColor: 0xff1C1C1C,
                  text: 'AC',
                  //filColor: 0xFF6C807F,
                  filColor: 0xffD4D4D2,
                  txtSize: 20.sp,
                  callback: allClear,
                ),
                CalculatorButton(
                  txtColor: 0xff1C1C1C,
                  text: 'C',
                  filColor: 0xFFD4D4D2,
                  callback: clear,
                ),
                CalculatorButton(
                  txtColor: 0xff1C1C1C,
                  text: '%',
                  filColor: 0xFFD4D4D2,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '÷',
                  txtSize: 35.sp,
                  //filColor: 0xFFffc300,
                  filColor: 0xFFFF9500,
                  txtColor: 0xFFffffff,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '7',
                  //txtColor: 0xFF65BDAC,
                  txtColor: 0xFFFFFFFF,
                  //filColor: 0xFFFFFFFF,
                  filColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '8',
                  txtColor: 0xFFFFFFFF,
                  filColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '9',
                  txtColor: 0xFFFFFFFF,
                  filColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '×',
                  txtSize: 35.sp,
                  filColor: 0xFFFF9500,
                  txtColor: 0xFFFFFFFF,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '4',
                  txtColor: 0xFFFFFFFF,
                  filColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '5',
                  txtColor: 0xFFFFFFFF,
                  filColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '6',
                  txtColor: 0xFFFFFFFF,
                  filColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '-',
                  filColor: 0xFFFF9500,
                  txtColor: 0xFFffffff,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '1',
                  txtColor: 0xFFFFFFFF,
                  filColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '2',
                  txtColor: 0xFFFFFFFF,
                  filColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '3',
                  txtColor: 0xFFFFFFFF,
                  filColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '+',
                  filColor: 0xFFFF9500,
                  txtColor: 0xFFffffff,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '0',
                  txtColor: 0xFFFFFFFF,
                  filColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '00',
                  txtColor: 0xFFFFFFFF,
                  filColor: 0xFF505050,
                  callback: numClick,
                  txtSize: 26.sp,
                ),
                CalculatorButton(
                  text: '.',
                  txtColor: 0xFFFFFFFF,
                  filColor: 0xFF505050,
                  callback: numClick,
                ),
                CalculatorButton(
                  text: '=',
                  filColor: 0xFFFF9500,
                  txtColor: 0xFFffffff,
                  callback: evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
