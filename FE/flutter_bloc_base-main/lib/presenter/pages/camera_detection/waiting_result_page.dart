import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class WaitingResultPage extends StatefulWidget {
  const WaitingResultPage({super.key});

  @override
  State<WaitingResultPage> createState() => _WaitingResultPageState();
}

class _WaitingResultPageState extends State<WaitingResultPage> {
  Timer? _autoBackTimer;

  @override
  void initState() {
    super.initState();
    _autoBackTimer = Timer(const Duration(seconds: 5), () {
      if (!mounted) return;
      context.router.maybePop();
    });
  }

  @override
  void dispose() {
    _autoBackTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 64,
            ),
            const SizedBox(height: 20),
            const Text(
              'Thông tin đã được gửi lên server',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            const Text(
              'Feedback sẽ được gửi về trong giây lát',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
