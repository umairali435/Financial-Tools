import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tax_calc/utils/colors.dart';
import 'package:tax_calc/widgets/calculator_button.dart';

class MathsCalculator extends StatefulWidget {
  const MathsCalculator({super.key});

  @override
  State<MathsCalculator> createState() => _MathsCalculatorState();
}

class _MathsCalculatorState extends State<MathsCalculator> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: const Alignment(1.0, 1.0),
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    color: Color(0xFF545F61),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: const Alignment(1.0, 1.0),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                    fontSize: 48,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalculatorButton(
                text: 'AC',
                fillColor: 0xFF6C807F,
                textSize: 20,
                callback: allClear,
              ),
              CalculatorButton(
                text: 'C',
                fillColor: 0xFF6C807F,
                callback: clear,
              ),
              CalculatorButton(
                text: '%',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                callback: numClick,
              ),
              CalculatorButton(
                text: '/',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalculatorButton(
                text: '7',
                callback: numClick,
              ),
              CalculatorButton(
                text: '8',
                callback: numClick,
              ),
              CalculatorButton(
                text: '9',
                callback: numClick,
              ),
              CalculatorButton(
                text: '*',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                textSize: 24,
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalculatorButton(
                text: '4',
                callback: numClick,
              ),
              CalculatorButton(
                text: '5',
                callback: numClick,
              ),
              CalculatorButton(
                text: '6',
                callback: numClick,
              ),
              CalculatorButton(
                text: '-',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                textSize: 38,
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalculatorButton(
                text: '1',
                callback: numClick,
              ),
              CalculatorButton(
                text: '2',
                callback: numClick,
              ),
              CalculatorButton(
                text: '3',
                callback: numClick,
              ),
              CalculatorButton(
                text: '+',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                textSize: 30,
                callback: numClick,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalculatorButton(
                text: '.',
                callback: numClick,
              ),
              CalculatorButton(
                text: '0',
                callback: numClick,
              ),
              CalculatorButton(
                text: '00',
                callback: numClick,
                textSize: 26,
              ),
              CalculatorButton(
                text: '=',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                callback: evaluate,
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
