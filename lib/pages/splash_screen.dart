import 'package:flutter/material.dart';

import 'package:simple_news/styles.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.primaryColor,
        body: Center(
          child: Column(
            children: [
              Spacer(),
              Expanded(
                child: Image(
                  width: 50,
                  height: 50,
                  image: AssetImage('assets/img/icon.png'),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 8),
                    Text('Loading'),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
