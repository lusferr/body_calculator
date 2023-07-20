import 'package:flutter/material.dart';
import 'package:flutter_body_calculation/widgets/left_bar.dart';
import 'package:flutter_body_calculation/widgets/right_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;
  String _textResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Body Calculator',
          style:
              TextStyle(color: Colors.blue[400], fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Altura",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Peso",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              child: FilledButton(
                onPressed: () {
                  double h = double.parse(_heightController.text);
                  double w = double.parse(_weightController.text);

                  setState(() {
                    _bmiResult = w / (h * h);
                    if (_bmiResult > 25) {
                      _textResult = 'Acima do peso';
                    } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                      _textResult = 'Peso adequado';
                    } else {
                      _textResult = 'Abaixo do peso';
                    }
                  });
                },
                child: const Text(
                  'Calcular',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: const TextStyle(fontSize: 90, color: Colors.blueAccent),
              ),
            ),
            const SizedBox(height: 30),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: SizedBox(
                child: Text(
                  _textResult,
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            // DESENHOR DE LAYOUT
            const SizedBox(height: 15),
            const LeftBar(barWidth: 50),
            const SizedBox(height: 15),
            const LeftBar(barWidth: 90),
            const SizedBox(height: 15),
            const LeftBar(barWidth: 50),
            const SizedBox(height: 15),
            const RightBar(barWidth: 40),
            const SizedBox(height: 15),
            const RightBar(barWidth: 60),
            const SizedBox(height: 15),
            const RightBar(barWidth: 80),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
