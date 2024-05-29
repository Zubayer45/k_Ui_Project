import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class check_all extends StatefulWidget {
  const check_all({super.key});

  @override
  State<check_all> createState() => _check_allState();
}

class _check_allState extends State<check_all> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        title: Title(
            color: Colors.black,
            child: Text(
              " Check all ",
              style: TextStyle(fontSize: 22),
            )),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text('Next add It')],
          ),
        ),
      )),
    );
  }
}
