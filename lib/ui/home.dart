import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String calculatedBMI = ''; // Variable to hold the calculated BMI
  String bmiStatus = ''; // Variable to hold the BMI status

  void calculateBMI() {
    // You can perform your BMI calculation here using the entered values
    // ignore: unused_local_variable
    double age = double.tryParse(ageController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ??
        0.0 * 0.3048; // Convert feet to meters;
    double weight = double.tryParse(weightController.text) ??
        0.0 * 0.453592; // Convert pounds to kilograms;

    if (height > 0 && weight > 0) {
      // Perform BMI calculation
      double bmi = weight / (height * height);

      setState(() {
        calculatedBMI = 'Your BMI: $bmi';

        // Check BMI range and update status
        if (bmi > 25) {
          bmiStatus = 'Overweight';
        } else if (bmi >= 18.5 && bmi <= 24.9) {
          bmiStatus = 'Normal';
        } else {
          bmiStatus = 'Underweight';
        }
        ('Your BMI weight is $bmi');
      });
    } else {
      // Handle invalid input (height or weight <= 0)
      setState(() {
        calculatedBMI = 'Invalid input. Please enter valid height and weight.';
        bmiStatus = '';
      });
    }

    // Perform your BMI calculation logic here using the age, height, and weight
  }

  void clearFields() {
    // Clear text field values and reset BMI-related information
    ageController.clear();
    heightController.clear();
    weightController.clear();
    setState(() {
      calculatedBMI = '';
      bmiStatus = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI App"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.5),
          children: [
            Image.asset(
              "images/bmilogo.png",
              height: 100.00,
              width: 150.00,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Age',
                      hintText: "Enter your age",
                      icon: Icon(Icons.person_outlined),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  const SizedBox(
                      height: 20), // Adds spacing between text fields
                  TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Height in feet',
                      hintText: 'Enter your height (in feet)',
                      icon: Icon(Icons.height_outlined),
                    ),
                  ),
                  const SizedBox(
                      height: 20), // Adds spacing between text fields
                  TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'weight in lb',
                      hintText: 'Enter your weight (in pounds)',
                      icon: Icon(Icons.line_weight_outlined),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(50),
                        child: ElevatedButton(
                          onPressed: calculateBMI,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                          ),
                          child: const Text(
                            'Calculate',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(50),
                        child: ElevatedButton(
                          onPressed: clearFields,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                          ),
                          child: const Text(
                            'Clear',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        // Add other widgets or functionality within the Column as needed
                      )
                    ],
                  ),
                  Text(
                    calculatedBMI,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(15)),

                  Text(
                    ' $bmiStatus',
                    style: const TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
