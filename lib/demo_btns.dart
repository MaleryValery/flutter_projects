import 'package:flutter/material.dart';

class DemoBtns extends StatefulWidget {
  const DemoBtns({super.key});

  @override
  State<DemoBtns> createState() => _DemoBtnsState();
}

class _DemoBtnsState extends State<DemoBtns> {
  bool _isUnderstood = false;

  @override
  Widget build(context) {
    print('btn BUILD called');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  _isUnderstood = false;
                });
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isUnderstood = true;
                });
              },
              child: const Text('Yes'),
            ),
          ],
        ),
        if (_isUnderstood) const Text('Awesome!'),
      ],
    );
  }
}
