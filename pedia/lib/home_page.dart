import 'package:flutter/material.dart';
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
                      onTap: () {},
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
                              "Delete Previous Student",
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
