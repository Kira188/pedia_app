import 'package:flutter/material.dart';
import 'package:pedia/delete_student.dart';
import 'package:pedia/gradient_scaffold.dart';
import 'package:pedia/sdc/sdc_page.dart';
import 'package:pedia/database_helper.dart';

class HomePage extends StatelessWidget {
  final DatabaseHelper dbHelper;

  const HomePage({super.key, required this.dbHelper});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      showBackButton: false, // Turn off back button
      appBarText: "Pedia Predict",
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () {
                        debugPrint("New Student Add Tap");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SdcPage(dbHelper: dbHelper);
                        }));
                      },
                      child: Card(
                        color: const Color.fromARGB(255, 238, 198, 150),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Center(
                            child: Text(
                              "Add New Student",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () async {
                        debugPrint("Export to Excel Tap");
                        await DatabaseHelper().exportDatabaseToExcel();

                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Export Complete"),
                                content: const Text(
                                    "Data has been successfully exported to Excel."),
                                actions: [
                                  TextButton(
                                    child: const Text("OK"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Card(
                        color: const Color.fromARGB(255, 238, 198, 150),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Center(
                            child: Text(
                              "Export to Excel",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DeleteStudent(dbHelper: dbHelper)));
                      },
                      child: Card(
                        color: const Color.fromARGB(255, 238, 198, 150),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Center(
                            child: Text(
                              "Show/Delete Students",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
