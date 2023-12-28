import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  double buttonPositionX = 0;
  double buttonPositionY = 0;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              left: buttonPositionX,
              top: buttonPositionY,
              child: MouseRegion(
                onEnter: (_) {
                  moveButtonToRandomPosition();
                },
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return ElevatedButton(
                      onPressed: () {
                        // Button is unclickable
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 106, 156),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      ),
                      child: Text(
                        "Click me if you can :p",
                        style: GoogleFonts.cuteFont(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void moveButtonToRandomPosition() {
    final random = Random();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonWidth = 100.0;
    final buttonHeight = 36.0;

    setState(() {
      buttonPositionX = random.nextDouble() * (screenWidth - buttonWidth);
      buttonPositionY = random.nextDouble() * (screenHeight - buttonHeight);
      controller.forward(from: 0);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
