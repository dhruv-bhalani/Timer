import 'dart:async';

import 'package:flutter/material.dart';

class StopClock extends StatefulWidget {
  const StopClock({super.key});

  @override
  State<StopClock> createState() => _StopClockState();
}

class _StopClockState extends State<StopClock> {
  DateTime dateTime = DateTime.now();
  Timer? timer;
  int minute = 00;
  int second = 00;
  int mills = 00;
  bool stop = false;

  void _timer() {
    stop = true;
    Future.delayed(
      const Duration(milliseconds: 10),
      () {
        setState(() {
          if (stop) {
            mills++;
          }
          if (mills > 60) {
            second++;
            mills = 0;
          }
          if (second > 60) {
            minute++;
            second = 0;
          }
          if (minute > 23) {
            minute = 0;
          }
        });
        if (stop) {
          _timer();
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 280,
              ),
              // Time
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " ${minute.toString().padLeft(2, '0')} : ${second.toString().padLeft(2, '0')} : ${mills.toString().padLeft(2, '0')} ",
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (stop) {
                        stop = false;
                      }
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.stop,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (!stop) {
                        _timer();
                      }
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.play_arrow,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      stop = false;
                      minute = 00;
                      second = 00;
                      mills = 00;
                      timer?.cancel();
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.refresh,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
