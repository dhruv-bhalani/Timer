import 'package:flutter/material.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
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
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "  ${(dateTime.hour % 12).toString().padLeft(2, "0")} : ${dateTime.minute.toString().padLeft(2, "0")} : ${dateTime.second.toString().padLeft(2, "0")}",
                    style: const TextStyle(
                      fontSize: 38,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    dateTime.hour < 12 ? "AM" : "PM",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Text(
                "${dateTime.day} : ${dateTime.month - 1} : ${dateTime.year} ",
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
