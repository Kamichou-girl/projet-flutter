import 'package:flutter/material.dart';

class SpendingLimitSlider extends StatefulWidget {
  @override
  _SpendingLimitSliderState createState() => _SpendingLimitSliderState();
}

class _SpendingLimitSliderState extends State<SpendingLimitSlider> {
  double _currentLimit = 4600; // Valeur initiale du slider

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: _currentLimit,
          min: 0,
          max: 10000,
          divisions: 100,
          label: "\$${_currentLimit.toStringAsFixed(0)}",
          activeColor: Colors.blue,
          inactiveColor: Colors.grey[300],
          onChanged: (double value) {
            setState(() {
              _currentLimit = value;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$0", style: TextStyle(color: Colors.grey, fontSize: 14)),
            Text("\$4,600", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
            Text("\$10,000", style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
      ],
    );
  }
}
