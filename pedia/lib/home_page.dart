import 'package:flutter/material.dart';
import 'package:pedia/container_one.dart';
import 'package:pedia/gradient_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "lib/assets/aher-logo.jpeg",
                  width: 100,
                ),
                Image.asset(
                  "lib/assets/jss logo.jpg",
                  width: 100,
                ),
              ],
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "Pedia Predict",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const ContainerOne(
                        text1: "1",
                        text2: "Socio Demographic Characteristics",
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {},
                      child: const ContainerOne(
                        text1: "2",
                        text2: "Eating Habits",
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {},
                      child: const ContainerOne(
                        text1: "3",
                        text2: "Physical Activity And Sedentary Lifestyle",
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {},
                      child: const ContainerOne(
                        text1: "4",
                        text2: "Mental Health And Well Being",
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {},
                      child: const ContainerOne(
                        text1: "5",
                        text2: "Sleep Quality",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
