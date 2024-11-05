import 'package:flutter/material.dart';
import 'package:fluter_task/services/api_service.dart'; // Update with your actual path

class StaticRecordsPage extends StatelessWidget {
  final String id; // Add a parameter to receive the ID

  const StaticRecordsPage({super.key, required this.id}); // Update the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "الاقسام",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 12.0,
        shadowColor: Colors.black.withOpacity(1.0),
      ),
      body: FutureBuilder<dynamic>(
        future: ApiService().fetchOfficeTree(id), // Fetch the data using the ID
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          }

          // If we have data, display it and print to console
          final List<dynamic> officeData = snapshot.data; // Now we treat officeData as a list

          // Print officeData to the console
          print(officeData); // Add this line to print the data

          return ListView.builder(
            itemCount: officeData.length, // Adjust based on the response structure
            itemBuilder: (context, index) {
              final department = officeData[index]; // Get the current department

              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2.0), // Border
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  color: Colors.white, // Background color
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Add margin
                child: ExpansionTile(
                  title: Text(
                    department['name'], // Department name
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // You can change the color if needed
                    ),
                  ),
                  subtitle: Text(department['complete_code']), // Department code
                  children: [
                    // Show branches here
                    if (department['branches'] != null) ...[
                      for (var branch in department['branches'])
                        ListTile(
                          title: Text(branch['name']), // Branch name
                          subtitle: Text(branch['complete_code']), // Branch code
                          trailing: const Icon(Icons.arrow_forward, color: Colors.green), // Trailing Icon
                          onTap: () {
                            // Handle link click

                          },
                        ),
                    ],
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
