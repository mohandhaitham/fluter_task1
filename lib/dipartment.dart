import 'package:flutter/material.dart';

class RecordsPage extends StatelessWidget {
  const RecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0087C7),
        elevation: 12.0, // Shadow for the AppBar
        shadowColor: Colors.black.withOpacity(1.0),
        centerTitle: false, // Ensure the title is aligned to the left
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between title and logo
          children: [
            const Text(
              "الاقسام",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/logo.png', // Ensure the path to the logo is correct
              height: 50.0,
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.white,
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'اقسام المجاميع السياحية',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0087C7), // Slightly darker blue for emphasis
                    letterSpacing: 1.0, // Increases spacing between letters
                    shadows: [
                      Shadow(
                        blurRadius: 6.0,
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                const SizedBox(height: 20),

                // First List Item with highlight
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF0087C7), width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    splashColor: Color(0xFF0087C7).withOpacity(0.3), // Splash color when tapped
                    onTap: () {
                      print('المكتب الوطني tapped');
                    },
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'المكتب الوطني',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0087C7),
                            ),
                          ),
                          Text(
                            't-f-g-1',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF0087C7),
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward, color: Color(0xFF0087C7)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Second List Item with highlight
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF0087C7), width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    splashColor: Color(0xFF0087C7).withOpacity(0.3), // Splash color when tapped
                    onTap: () {
                      print('قسم السياحة الدينية tapped');
                    },
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'قسم السياحة الدينية',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0087C7),
                            ),
                          ),
                          Text(
                            't-f-g-1',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF0087C7),
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward, color: Color(0xFF0087C7)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Third List Item with highlight
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF0087C7), width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    splashColor: Color(0xFF0087C7).withOpacity(0.3), // Splash color when tapped
                    onTap: () {
                      print('قسم السفر والسياحة tapped');
                    },
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'قسم السفر والسياحة',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0087C7),
                            ),
                          ),
                          Text(
                            't-f-g-1',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF0087C7),
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward, color: Color(0xFF0087C7)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Fourth List Item with highlight
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF0087C7), width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    splashColor: Color(0xFF0087C7).withOpacity(0.3), // Splash color when tapped
                    onTap: () {
                      print('قسم العلاقات الدولية tapped');
                    },
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'قسم العلاقات الدولية',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0087C7),
                            ),
                          ),
                          Text(
                            't-f-g-1',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF0087C7),
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward, color: Color(0xFF0087C7)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RecordsPage(),
  ));
}
