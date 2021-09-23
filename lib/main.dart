import 'dart:developer';

import 'package:flutter/material.dart';
import 'widgets/country_phone_textfield.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Country Phone Code Input',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CountryPhoneTextField(
              padding: 40.0,
              fillColor: Colors.white,
              initialCountryCode: 'TR',
              exclude: ['EN', 'FR'],
              prefixColor: Colors.black,
              phoneCode: (phoneCode) {
                log(phoneCode);
              },
            ),
          ],
        ),
      ),
    );
  }
}
