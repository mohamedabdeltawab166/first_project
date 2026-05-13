import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  // 👤 User Data
  String userName = "Mohamed";
  String userEmail = "mohamed@gmail.com";

  String weight = "70 kg";
  String height = "170 cm";
  String calories = "2200";
  String water = "5/8";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF5F6FA),

      body: SafeArea(
        child: SingleChildScrollView(

          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              const SizedBox(height: 10),

              // 👤 Profile Image
              Container(
                width: 110,
                height: 110,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.15),
                ),

                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 18),

              // 👤 Name
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              // 📧 Email
              Text(
                userEmail,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 30),

              // 📊 Stats
              Row(
                children: [

                  Expanded(
                    child: statCard(
                      title: "Weight",
                      value: weight,
                      icon: Icons.monitor_weight,
                      color: Colors.orange,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: statCard(
                      title: "Height",
                      value: height,
                      icon: Icons.height,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Row(
                children: [

                  Expanded(
                    child: statCard(
                      title: "Calories",
                      value: calories,
                      icon: Icons.local_fire_department,
                      color: Colors.red,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: statCard(
                      title: "Water",
                      value: water,
                      icon: Icons.water_drop,
                      color: Colors.cyan,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ⚙️ Account
              sectionTitle("Account"),

              const SizedBox(height: 15),

              profileTile(
                icon: Icons.edit_outlined,
                title: "Edit Profile",

                onTap: () {
                  print("Edit Profile");
                },
              ),

              profileTile(
                icon: Icons.notifications_none,
                title: "Notifications",

                onTap: () {
                  print("Notifications");
                },
              ),

              profileTile(
                icon: Icons.lock_outline,
                title: "Privacy & Security",

                onTap: () {
                  print("Privacy");
                },
              ),

              const SizedBox(height: 25),

              // 📌 More
              sectionTitle("More"),

              const SizedBox(height: 15),

              profileTile(
                icon: Icons.help_outline,
                title: "Help Center",

                onTap: () {
                  print("Help Center");
                },
              ),

              profileTile(
                icon: Icons.info_outline,
                title: "About App",

                onTap: () {
                  print("About App");
                },
              ),

              profileTile(
                icon: Icons.logout,
                title: "Logout",
                color: Colors.red,

                onTap: () {

                  showDialog(
                    context: context,

                    builder: (context) {
                      return AlertDialog(

                        title: const Text("Logout"),

                        content: const Text(
                          "Are you sure you want to logout?",
                        ),

                        actions: [

                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },

                            child: const Text("Cancel"),
                          ),

                          TextButton(
                            onPressed: () {

                              Navigator.pop(context);

                              print("Logout");
                            },

                            child: const Text("Logout"),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ================= SECTION TITLE =================

  Widget sectionTitle(String title) {

    return Align(
      alignment: Alignment.centerLeft,

      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // ================= PROFILE TILE =================

  Widget profileTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = Colors.black,
  }) {

    return GestureDetector(

      onTap: onTap,

      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Row(
          children: [

            Container(
              width: 45,
              height: 45,

              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(14),
              ),

              child: Icon(
                icon,
                color: color,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ),

            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  // ================= STAT CARD =================

  Widget statCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {

    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Column(
        children: [

          Container(
            width: 55,
            height: 55,

            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(18),
            ),

            child: Icon(
              icon,
              color: color,
              size: 28,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}