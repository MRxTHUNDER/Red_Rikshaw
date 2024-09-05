import 'package:flutter/material.dart';

import '../Models/OnboardingDataModel.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;

  const OnboardingPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: data.image, height: 250),
        SizedBox(height: 20),
        Text(
          data.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            data.description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}