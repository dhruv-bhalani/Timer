import 'package:flutter/material.dart';

class ReverseClock extends StatefulWidget {
  const ReverseClock({super.key});

  @override
  State<ReverseClock> createState() => _ReverseClockState();
}

class _ReverseClockState extends State<ReverseClock> {
  DateTime dateTime = DateTime.now();

  int minute = 00;
  int second = 00;
  bool stop = false;

  void timer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!stop) {
        setState(() {
          if (second > 0) {
            second--;
          } else {
            if (minute > 0) {
              minute--;
              second = 59;
            }
          }
        });
      }
      timer();
    });
  }

  @override
  void initState() {
    timer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${minute.toString().padLeft(2, '0')} : ${second.toString().padLeft(2, '0')}",
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Minute
                  Container(
                    height: s.height * 0.08,
                    width: s.width * 0.3,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: ListWheelScrollView(
                      itemExtent: 30,
                      useMagnifier: true,
                      magnification: 1.2,
                      diameterRatio: 0.5,
                      onSelectedItemChanged: (index) {
                        setState(() {
                          minute = index;
                        });
                      },
                      children: List.generate(
                        60,
                        (index) => Text(
                          "$index",
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Second
                  Container(
                    height: s.height * 0.08,
                    width: s.width * 0.3,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: ListWheelScrollView(
                      itemExtent: 30,
                      useMagnifier: true,
                      magnification: 1.2,
                      diameterRatio: 0.5,
                      onSelectedItemChanged: (index) {
                        setState(() {
                          second = index;
                        });
                      },
                      children: List.generate(
                        60,
                        (index) => Text(
                          "$index",
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      stop = false;
                      timer();
                      setState(() {});
                    },
                    child: const Text(
                      "Start",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      stop = true;
                      setState(() {});
                    },
                    child: const Text(
                      "Stop",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
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
