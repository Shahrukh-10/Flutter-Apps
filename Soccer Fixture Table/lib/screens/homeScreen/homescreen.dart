import 'package:flutter/material.dart';

import 'package:auth_ui/screens/homeScreen/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     body: Body(),

    );
  }
}