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
      title: 'Flutter Demo',
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CountryPhoneTextField(
              fillColor: Colors.grey.shade500,
              initialCountryCode: 'TR',
              exclude: ['EN', 'FR'],
              prefixColor: Colors.white,
              onCountry: (country) {
                log(country!.countryCode);
              },
            ),
          ],
        ),
      ),
    );
  }
}
