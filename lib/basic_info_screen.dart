import 'package:flutter/material.dart';
import 'lifestyle_screen.dart';

class BasicInfoScreen extends StatefulWidget {
  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {

  int selectedGender = -1;

  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Progress
            Row(
              children: [

                Expanded(
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(width: 8),

                Expanded(
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(width: 8),

                Expanded(
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),

            Text(
              "Basic Information",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),

            Text(
              "Help us calculate your needs.",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),

            SizedBox(height: 30),

            // Gender
            Text("Gender"),

            SizedBox(height: 12),

            Row(
              children: [

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 0;
                      });
                    },

                    child: Container(
                      height: 55,

                      decoration: BoxDecoration(
                        color: selectedGender == 0
                            ? Colors.blue
                            : Colors.grey[200],

                        borderRadius: BorderRadius.circular(14),
                      ),

                      child: Center(
                        child: Text(
                          "Male",
                          style: TextStyle(
                            color: selectedGender == 0
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 12),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 1;
                      });
                    },

                    child: Container(
                      height: 55,

                      decoration: BoxDecoration(
                        color: selectedGender == 1
                            ? Colors.blue
                            : Colors.grey[200],

                        borderRadius: BorderRadius.circular(14),
                      ),

                      child: Center(
                        child: Text(
                          "Female",
                          style: TextStyle(
                            color: selectedGender == 1
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            // Age
            Text("Age"),

            SizedBox(height: 8),

            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,

              decoration: InputDecoration(
                hintText: "e.g. 25",

                filled: true,
                fillColor: Colors.grey[200],

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 20),

            Row(
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Weight (kg)"),

                      SizedBox(height: 8),

                      TextField(
                        controller: weightController,
                        keyboardType: TextInputType.number,

                        decoration: InputDecoration(
                          hintText: "70",

                          filled: true,
                          fillColor: Colors.grey[200],

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Height (cm)"),

                      SizedBox(height: 8),

                      TextField(
                        controller: heightController,
                        keyboardType: TextInputType.number,

                        decoration: InputDecoration(
                          hintText: "170",

                          filled: true,
                          fillColor: Colors.grey[200],

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Spacer(),

            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                onPressed: () {

                  String gender =
                  selectedGender == 0 ? "Male" : "Female";

                  print(gender);
                  print(ageController.text);
                  print(weightController.text);
                  print(heightController.text);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LifestyleScreen(),
                    ),
                  );
                },

                child: Text(
                  "Continue →",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}