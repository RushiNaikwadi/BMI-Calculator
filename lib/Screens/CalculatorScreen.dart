import 'package:bmi_calculator/Screens/BMImodel.dart';
import 'package:bmi_calculator/Screens/ResultScreen.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  double _weightOfUser = 10.0;
  double _heightOfUser = 50.0;
  double _bmi = 0.0;

  late BMImodel _bmiModel;

  String doComment(value) {
    if (_bmi < 18.5) {
      return "Ohh! You are Underweight";
    } else if (_bmi < 25) {
      return "Whoa! You are Fit";
    } else if (_bmi < 25) {
      return "Ohh! You are Overweight";
    }
    return "Ohh! You are Obese";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child:Image.asset(
                        'assets/heart.png',
                        colorBlendMode: BlendMode.darken,
                        fit: BoxFit.fitWidth
                    )
                  ),
                  const Text(
                    'BMI Calculator',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'We care for your health',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontFamily: 'DancingScript',
                    ),
                  ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Weight : ',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.blueAccent,
                      ),
                    ),
                    Text(
                      '${double.parse(_weightOfUser.toStringAsFixed(1))} kg',
                      style: const TextStyle(
                          fontSize: 28,
                          color: Colors.pinkAccent
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                    width: 330,
                    child: Slider(
                      min: 10,
                      max: 200,
                      value: _weightOfUser,
                      onChanged: (height) {
                        setState(() {
                          _weightOfUser = height;
                        });
                      },
                      divisions: 190,
                      activeColor: Colors.pinkAccent,
                      label: '${double.parse(_weightOfUser.toStringAsFixed(1))}',
                    )
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Height : ',
                      style: TextStyle(
                          fontSize: 30,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Text(
                      '${double.parse(_heightOfUser.toStringAsFixed(1))} cm',
                      style: const TextStyle(
                          fontSize: 28,
                          color: Colors.pinkAccent
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                    width: 330,
                    child: Slider(
                    min: 50,
                    max: 250,
                    value: _heightOfUser,
                    onChanged: (height) {
                      setState(() {
                        _heightOfUser = height;
                      });
                    },
                    divisions: 200,
                    activeColor: Colors.pinkAccent,
                    label: '${double.parse(_heightOfUser.toStringAsFixed(1))}',
                  )
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        double heightInMeters = _heightOfUser / 100;
                        _bmi = (_weightOfUser / (heightInMeters * heightInMeters));
                        _bmiModel = BMImodel(bmi: _bmi, isNormal: (_bmi >= 18.5 && _bmi <= 25), comments: doComment(_bmi));
                      });
                      
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(bmiModel: _bmiModel)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                    ),
                    child: const Text('Calculate'),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
