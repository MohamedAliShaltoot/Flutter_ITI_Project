import 'package:flutter/material.dart';

class Defaultscreen extends StatelessWidget {
  const Defaultscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Default Screen'),
      ),
      body: Center(
        child: Text('Your navigation is wrong'),
      ),
    );
  }
}
