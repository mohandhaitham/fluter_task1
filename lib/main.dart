import 'package:fluter_task/tables/agenda.dart';
import 'package:fluter_task/tables/search.dart';
import 'package:flutter/material.dart';
import 'dipartment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0087C7),
        elevation: 12.0,
        shadowColor: Colors.black.withOpacity(0.3),
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "الدوائر",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/logo.png',
              height: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              _buildCustomButton(context, 'دائرة المجاميع السياحية', '1'),
              const SizedBox(height: 20),
              _buildCustomButton(context, 'دائرة التفتيش والمتابعة', '2'),
              const SizedBox(height: 20),
              _buildCustomButton(context, 'دائرة المرافق السياحية', '3'),
              const SizedBox(height: 20),
              _buildCustomButton(context, 'دائرة الإدارية والمالية', '4'),
              const SizedBox(height: 20),
              _buildCustomButton(context, 'مكتب رئيس الهيئة', '5'),
              const SizedBox(height: 60), // Add some spacing before the two new buttons
              Row(
                children: [
          
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10.0,
                            offset: const Offset(1, 7),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
          
                        style: ElevatedButton.styleFrom(
          
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          backgroundColor: const Color(0xFF00A74D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AgendaPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'الاجندة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Spacing between the two buttons
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10.0,
                            offset: const Offset(1, 7),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
          
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          backgroundColor: const Color(0xFF00A74D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchPage(),
                            ),
                          );                    },
                        child: const Text(
                          'بحث',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomButton(BuildContext context, String text, String id) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10.0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          backgroundColor: const Color(0xFF0087C7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
          ),
          elevation: 5,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecordsPage(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
