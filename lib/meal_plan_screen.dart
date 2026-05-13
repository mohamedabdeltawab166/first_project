import 'package:flutter/material.dart';

class MealPlanScreen extends StatefulWidget {
  const MealPlanScreen({super.key});

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFF5F6FA),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const SizedBox(height: 20),

            // 🍽 Title
            const Text(
              "Meal Plan",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              "Personalized for your condition",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 25),

            // 🔘 Tabs
            Container(
              height: 50,

              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
              ),

              child: Row(
                children: [

                  // Daily Plan
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = 0;
                        });
                      },

                      child: Container(
                        margin: const EdgeInsets.all(5),

                        decoration: BoxDecoration(
                          color: selectedTab == 0
                              ? Colors.white
                              : Colors.transparent,

                          borderRadius:
                          BorderRadius.circular(12),
                        ),

                        child: Center(
                          child: Text(
                            "Daily Plan",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: selectedTab == 0
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Food Guide
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = 1;
                        });
                      },

                      child: Container(
                        margin: const EdgeInsets.all(5),

                        decoration: BoxDecoration(
                          color: selectedTab == 1
                              ? Colors.white
                              : Colors.transparent,

                          borderRadius:
                          BorderRadius.circular(12),
                        ),

                        child: Center(
                          child: Text(
                            "Food Guide",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: selectedTab == 1
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 📋 Content
            Expanded(
              child: selectedTab == 0
                  ? dailyPlanWidget()
                  : foodGuideWidget(),
            ),
          ],
        ),
      ),
    );
  }

  // ================= DAILY PLAN =================

  Widget dailyPlanWidget() {
    return ListView(
      children: [

        mealSection(
          emoji: "🥣",
          title: "Breakfast",

          meals: [
            {
              "name": "Oatmeal with berries",
              "portion": "1 bowl",
              "kcal": "320"
            },

            {
              "name": "Boiled egg whites (2)",
              "portion": "2 pieces",
              "kcal": "70"
            },
          ],
        ),

        const SizedBox(height: 20),

        mealSection(
          emoji: "🍛",
          title: "Lunch",

          meals: [
            {
              "name": "Grilled chicken breast",
              "portion": "150g",
              "kcal": "280"
            },

            {
              "name": "Brown rice",
              "portion": "½ cup",
              "kcal": "180"
            },

            {
              "name": "Steamed broccoli",
              "portion": "1 cup",
              "kcal": "55"
            },
          ],
        ),

        const SizedBox(height: 20),

        mealSection(
          emoji: "🌙",
          title: "Dinner",

          meals: [
            {
              "name": "Baked salmon fillet",
              "portion": "170g",
              "kcal": "360"
            },

            {
              "name": "Mixed green salad",
              "portion": "1 bowl",
              "kcal": "45"
            },
          ],
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  // ================= FOOD GUIDE =================

  Widget foodGuideWidget() {
    return ListView(
      children: [

        guideCard(
          title: "Foods To Eat",
          color: Colors.green,
          foods: [
            "Vegetables",
            "Fruits",
            "Whole grains",
            "Lean protein",
            "Low-fat dairy",
          ],
        ),

        const SizedBox(height: 20),

        guideCard(
          title: "Foods To Avoid",
          color: Colors.red,
          foods: [
            "Sugary drinks",
            "Fast food",
            "Processed snacks",
            "Excess salt",
            "Fried foods",
          ],
        ),
      ],
    );
  }

  // ================= SECTION =================

  Widget mealSection({
    required String emoji,
    required String title,
    required List<Map<String, String>> meals,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Row(
          children: [

            Text(
              emoji,
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(width: 8),

            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        ...meals.map(
              (meal) => mealCard(
            title: meal["name"]!,
            portion: meal["portion"]!,
            calories: meal["kcal"]!,
          ),
        ),
      ],
    );
  }

  // ================= MEAL CARD =================

  Widget mealCard({
    required String title,
    required String portion,
    required String calories,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "Portion: $portion",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          Text(
            "$calories kcal",
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ================= GUIDE CARD =================

  Widget guideCard({
    required String title,
    required Color color,
    required List<String> foods,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Row(
            children: [

              CircleAvatar(
                radius: 10,
                backgroundColor: color,
              ),

              const SizedBox(width: 10),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          ...foods.map(
                (food) => Padding(
              padding:
              const EdgeInsets.only(bottom: 10),

              child: Row(
                children: [

                  Icon(
                    Icons.check_circle,
                    color: color,
                    size: 20,
                  ),

                  const SizedBox(width: 10),

                  Text(
                    food,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}