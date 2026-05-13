import 'package:flutter/material.dart';
import 'home_screen.dart';

class LifestyleScreen extends StatefulWidget {
  @override
  State<LifestyleScreen> createState() => _LifestyleScreenState();
}

class _LifestyleScreenState extends State<LifestyleScreen> {

  int selectedActivity = -1;

  final allergyController = TextEditingController();

  List activityLevels = [
    "Low",
    "Medium",
    "High",
  ];

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
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),

            Text(
              "Lifestyle",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),

            Text(
              "Almost done!",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),

            SizedBox(height: 30),

            // Activity Level
            Text("Activity Level"),

            SizedBox(height: 14),

            Row(
              children: List.generate(
                activityLevels.length,
                    (index) {

                  bool isSelected =
                      selectedActivity == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedActivity = index;
                        });
                      },

                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 55,

                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.blue
                              : Colors.grey[200],

                          borderRadius: BorderRadius.circular(14),
                        ),

                        child: Center(
                          child: Text(
                            activityLevels[index],

                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 28),

            // Allergies
            Text("Food Allergies (optional)"),

            SizedBox(height: 10),

            TextField(
              controller: allergyController,

              decoration: InputDecoration(
                hintText: "e.g nuts, dairy...",

                filled: true,
                fillColor: Colors.grey[200],

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            Spacer(),

            // Start Plan Button
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
                  String activity = activityLevels[selectedActivity];

                  print(activity);
                  print(allergyController.text);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },

                child: Text(
                  "Start My Plan →",
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