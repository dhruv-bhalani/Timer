import 'dart:math';
import 'package:flutter/material.dart';

class AnalogClockPage extends StatefulWidget {
  const AnalogClockPage({super.key});

  @override
  State<AnalogClockPage> createState() => _AnalogClockPageState();
}

class _AnalogClockPageState extends State<AnalogClockPage> {
  DateTime dateTime = DateTime.now();

  void start() {
    Future.delayed(const Duration(seconds: 1), () {
      dateTime = DateTime.now();
      setState(() {});
      start();
    });
  }

  @override
  void initState() {
    start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          ...List.generate(
            60,
            (index) => Transform.rotate(
              angle: index * pi * 2 / 60,
              child: Divider(
                endIndent:
                    index % 5 == 0 ? size.width * 0.65 : size.width * 0.68,
                thickness: index % 5 == 0 ? 3 : 1,
                color: index % 5 == 0 ? Colors.white : Colors.white,
              ),
            ),
          ),
          Transform.rotate(
            angle: dateTime.hour * pi * 2 / 12,
            child: Transform.rotate(
              angle: pi / 2,
              child: Divider(
                indent: size.width * 0.2,
                endIndent: size.width * 0.35,
                thickness: 2,
                color: Colors.white,
              ),
            ),
          ),
          Transform.rotate(
            angle: dateTime.minute * pi * 2 / 60,
            child: Transform.rotate(
              angle: pi / 2,
              child: Divider(
                indent: size.width * 0.15,
                endIndent: size.width * 0.35,
                thickness: 2,
                color: Colors.red,
              ),
            ),
          ),
          Transform.rotate(
            angle: dateTime.second * pi * 2 / 60,
            child: Transform.rotate(
              angle: pi / 2,
              child: Divider(
                indent: size.width * 0.10,
                endIndent: size.width * 0.35,
                thickness: 2,
                color: Colors.white,
              ),
            ),
          ),
          const CircleAvatar(
            radius: 10,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
