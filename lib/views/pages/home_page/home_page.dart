import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/analog_clock_page.dart';
import 'components/digital_clock_page.dart';
import 'components/reverse.dart';
import 'components/stop_clock_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: NavigationRail(
                    groupAlignment: 0.1,
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      selectedIndex = value;
                      setState(() {});
                    },
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.timer),
                        label: Text('Clock'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(CupertinoIcons.clock_fill),
                        label: Text('Clock'),
                      ),
                      NavigationRailDestination(
                        label: Text('Timer'),
                        icon: Icon(Icons.timer_rounded),
                      ),
                      NavigationRailDestination(
                        label: Text('Timer'),
                        icon: Icon(Icons.timer_rounded),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IndexedStack(
                    index: selectedIndex,
                    children: [
                      Container(
                        height: 200,
                        width: 300,
                        alignment: Alignment.center,
                        child: const AnalogClockPage(),
                      ),
                      Container(
                        height: 200,
                        width: 300,
                        alignment: Alignment.center,
                        child: const DigitalClock(),
                      ),
                      Container(
                        height: 600,
                        width: 300,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: const StopClock(),
                      ),
                      Container(
                        height: 600,
                        width: 300,
                        alignment: Alignment.center,
                        child: const ReverseClock(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
