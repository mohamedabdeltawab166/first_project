import 'package:flutter/material.dart';
import 'meal_plan_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;
  int waterCount = 5;

  @override
  Widget build(BuildContext context) {

    final List<Widget> pages = [
      homeUI(),
      const MealPlanScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(

      backgroundColor: const Color(0xFFF5F6FA),

      body: pages[currentIndex],

      // 🔻 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_outlined),
            activeIcon: Icon(Icons.restaurant),
            label: "Meals",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // ================= HOME UI =================

  Widget homeUI() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: ListView(
          children: [

            const SizedBox(height: 20),

            // 👋 Greeting
            Text(
              "Good morning 👋",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "Welcome, John",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            // 💧 Water Intake Card
            Container(
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),

              child: Column(
                children: [

                  Row(
                    children: [

                      Container(
                        width: 45,
                        height: 45,

                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(14),
                        ),

                        child: const Icon(
                          Icons.water_drop_outlined,
                          color: Colors.blue,
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            const Text(
                              "Water Intake",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              "$waterCount of 8 glasses",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ➖ Minus
                      Container(
                        width: 40,
                        height: 40,

                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                          BorderRadius.circular(12),
                        ),

                        child: IconButton(
                          onPressed: () {
                            if (waterCount > 0) {
                              setState(() {
                                waterCount--;
                              });
                            }
                          },
                          icon: const Icon(Icons.remove),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // ➕ Plus
                      Container(
                        width: 40,
                        height: 40,

                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                          BorderRadius.circular(12),
                        ),

                        child: IconButton(
                          onPressed: () {
                            if (waterCount < 8) {
                              setState(() {
                                waterCount++;
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // 📊 Progress
                  Row(
                    children: List.generate(
                      8,
                          (index) => Expanded(
                        child: Container(
                          margin:
                          const EdgeInsets.only(right: 6),
                          height: 8,

                          decoration: BoxDecoration(
                            color: index < waterCount
                                ? Colors.blue
                                : Colors.grey[300],

                            borderRadius:
                            BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 🍽 Meals
            const Text(
              "Today's Meals",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            mealCard(
              title: "Breakfast",
              subtitle: "Oatmeal with berries",
              calories: "320",
              icon: Icons.breakfast_dining,
              iconColor: Colors.green,
            ),

            mealCard(
              title: "Lunch",
              subtitle: "Grilled chicken salad",
              calories: "450",
              icon: Icons.lunch_dining,
              iconColor: Colors.blueGrey,
            ),

            mealCard(
              title: "Dinner",
              subtitle: "Steamed salmon & veggies",
              calories: "480",
              icon: Icons.dinner_dining,
              iconColor: Colors.deepOrange,
            ),

            const SizedBox(height: 25),

            // 💡 Health Tip
            Container(
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: const Color(0xFFDFF5E8),
                borderRadius: BorderRadius.circular(22),
              ),

              child: Row(
                children: [

                  Container(
                    width: 42,
                    height: 42,

                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius:
                      BorderRadius.circular(14),
                    ),

                    child: const Icon(
                      Icons.lightbulb_outline,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        const Text(
                          "Health Tip",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "Choose fresh vegetables over canned to reduce sodium intake.",
                          style: TextStyle(
                            color: Colors.grey[700],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ================= MEAL CARD =================

  Widget mealCard({
    required String title,
    required String subtitle,
    required String calories,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Row(
        children: [

          Container(
            width: 50,
            height: 50,

            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),

            child: Icon(
              icon,
              color: iconColor,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment:
            CrossAxisAlignment.end,

            children: [

              Text(
                calories,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              Text(
                "kcal",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}