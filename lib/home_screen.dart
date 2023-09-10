import 'package:flutter/material.dart';

import 'bottle_painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double initialQuantity = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          "Water Bottle",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35))),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Text(
          "Powered By Omar Farouk",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: initialQuantity < 0.95
          ? FloatingActionButton.extended(
              onPressed: () {
                if (initialQuantity <= 0.95) {
                  setState(() {
                    initialQuantity += 0.1;
                  });
                }
                if (initialQuantity >= 0.95) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("La bouteille est pleine!"),
                  ));
                }
              },
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              label: const Text("Add"),
              icon: const Icon(Icons.add),
            )
          : FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  initialQuantity = 0;
                });
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: const Text("Vider"),
              icon: const Icon(Icons.clear),
            ),
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(
                200,
                500,
              ),
              painter: BottlePainter(initialQuantity),
            ),
            Positioned(
                top: 0,
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                )),
            Positioned(
                top: 250,
                child: Container(
                  width: 200,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.6),
                  ),
                  child: Text(
                    "${(initialQuantity * 500).ceilToDouble().toInt()} ML",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
