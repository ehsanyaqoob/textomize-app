import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add scan functionality here
                },
                child: Text('Start Scan'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add view documents functionality here
                },
                child: Text('View Documents'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add settings functionality here
                },
                child: Text('Settings'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add help functionality here
                },
                child: Text('Help'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
