import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:fluttercountdown/painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CountdownTimerController? controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  final _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    var _dateTime2 = DateTime(
        _dateTime.year, _dateTime.month, _dateTime.day, 23, 59, 59, 999);
    controller =
        CountdownTimerController(endTime: _dateTime2.millisecondsSinceEpoch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Countdown Timer'),
        centerTitle: true,
      ),
      body: CountdownTimer(
          endTime: endTime,
          controller: controller,
          widgetBuilder: (_, CurrentRemainingTime? time) {
            if (time == null) {
              // controller?.dispose();
              return Center(
                child: CustomPaint(
                  painter: MyTextCustomPainter(text: 'Timer finished'),
                  size: const Size(300, 300),
                ),
              );
            }
            var hours = time.hours?.toString();
            if (hours?.length == 1) {
              hours = '0$hours';
            }
            hours ??= '00';
            var mins = time.min?.toString();
            if (mins?.length == 1) {
              mins = '0$mins';
            }
            mins ??= '00';
            var secs = time.sec?.toString();
            if (secs?.length == 1) {
              secs = '0$secs';
            }
            secs ??= '00';
            return Center(
              child: CustomPaint(
                painter: MyTextCustomPainter(text: hours + ':' + mins + ':' + secs),
                size: const Size(300, 300),
              ),
            );
          }),
    );
  }
}
