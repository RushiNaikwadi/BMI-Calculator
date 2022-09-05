import 'package:bmi_calculator/Screens/BMImodel.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {

  BMImodel bmiModel;
  ResultScreen({super.key, required this.bmiModel});

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
                    child: bmiModel.isNormal ? Image.asset(
                        'assets/happy.png',
                        colorBlendMode: BlendMode.darken,
                        fit: BoxFit.fitWidth
                    ) : Image.asset(
                        'assets/sad.png',
                        colorBlendMode: BlendMode.darken,
                        fit: BoxFit.fitWidth
                    ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${double.parse(bmiModel.bmi.toStringAsFixed(1))}',
                  style: TextStyle(
                    fontSize: 35,
                    color: bmiModel.isNormal ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(height: 70),
                Text(
                  bmiModel.comments,
                  style: TextStyle(
                    fontSize: 30,
                    color: bmiModel.isNormal ? Colors.green : Colors.red,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.keyboard_backspace),
      ),
    );
  }
}
