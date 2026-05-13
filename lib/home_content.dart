import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  int waterCount = 5;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      children: [

        const SizedBox(height: 20),

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

        // 💧 Water Card
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

                  IconButton(
                    onPressed: () {
                      if (waterCount > 0) {
                        setState(() {
                          waterCount--;
                        });
                      }
                    },
                    icon: const Icon(Icons.remove),
                  ),

                  IconButton(
                    onPressed: () {
                      if (waterCount < 8) {
                        setState(() {
                          waterCount++;
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

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

        const SizedBox(height: 30),
      ],
    );
  }

  static Widget mealCard({
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}