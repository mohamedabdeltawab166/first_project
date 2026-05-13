import 'package:flutter/material.dart';
import 'basic_info_screen.dart';

class ConditionScreen extends StatefulWidget {
  @override
  State<ConditionScreen> createState() => _ConditionScreenState();
}

class _ConditionScreenState extends State<ConditionScreen> {

  int selectedIndex = -1;

  List conditions = [
    {
      "title": "Diabetes",
      "icon": Icons.water_drop_outlined,
      "color": Colors.blue,
    },

    {
      "title": "Kidney Disease",
      "icon": Icons.monitor_heart_outlined,
      "color": Colors.purple,
    },

    {
      "title": "High Blood Pressure",
      "icon": Icons.favorite_border,
      "color": Colors.red,
    },
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
                      color: Colors.grey[300],
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
              "Select Your Condition",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),

            Text(
              "We'll personalize your diet plan.",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),

            SizedBox(height: 40),

            // Conditions
            Expanded(
              child: ListView.builder(
                itemCount: conditions.length,
                itemBuilder: (context, index) {

                  bool isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },

                    child: Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(18),

                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.blue.withOpacity(0.1)
                            : Colors.white,

                        borderRadius: BorderRadius.circular(20),

                        border: Border.all(
                          color: isSelected
                              ? Colors.blue
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),

                      child: Row(
                        children: [

                          Container(
                            padding: EdgeInsets.all(12),

                            decoration: BoxDecoration(
                              color: conditions[index]["color"]
                                  .withOpacity(0.1),

                              borderRadius: BorderRadius.circular(14),
                            ),

                            child: Icon(
                              conditions[index]["icon"],
                              color: conditions[index]["color"],
                            ),
                          ),

                          SizedBox(width: 18),

                          Text(
                            conditions[index]["title"],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedIndex == -1
                      ? Colors.blue.shade100
                      : Colors.blue,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                onPressed: selectedIndex == -1
                    ? null
                    : () {

                  String selectedCondition =
                  conditions[selectedIndex]["title"];

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BasicInfoScreen(),
                    ),
                  );                },

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