import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intermideate_login_page/MonthlyStatementPage.dart';
import 'package:intermideate_login_page/checkTodat.dart';
import 'package:intermideate_login_page/employ_page.dart';
// import 'package:intermideate_login_page/logIn_page.dart';

class admin_page extends StatefulWidget {
  const admin_page({super.key});

  @override
  State<admin_page> createState() => _admin_pageState();
}

class _admin_pageState extends State<admin_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        title: Title(
            color: Colors.black,
            child: Text(
              "Admin Apge 2",
              style: TextStyle(fontSize: 22),
            )),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddEmployeeForm()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: const [
                        Color.fromARGB(255, 141, 248, 250),
                        Color.fromARGB(255, 237, 168, 191),
                      ]),
                      // color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                        child: Text(
                      'Add Employ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TimeTracker()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: const [
                        Color.fromARGB(255, 141, 248, 250),
                        Color.fromARGB(255, 237, 168, 191),
                      ]),
                      // color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                        child: Text(
                      'Check to day all',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MonthlyStatementPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: const [
                        Color.fromARGB(255, 141, 248, 250),
                        Color.fromARGB(255, 237, 168, 191),
                      ]),
                      // color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                        child: Text(
                      'Month wise all',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      )),
    );
  }
}
