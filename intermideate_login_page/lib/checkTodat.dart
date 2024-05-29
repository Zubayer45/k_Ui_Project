import 'package:flutter/material.dart';
import 'package:intermideate_login_page/chack_all.dart';
// import 'package:flutter_application_1/MonthlyStatementPage.dart';
// import 'package:flutter_application_1/monthlyStatementpage_dart';

void main() {
  runApp(MyApp());
}

class DateTimeRecord {
  DateTime inDateTime;
  DateTime outDateTime;

  DateTimeRecord({required this.inDateTime, required this.outDateTime});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TimeTracker(),
    );
  }
}

class TimeTracker extends StatefulWidget {
  @override
  _TimeTrackerState createState() => _TimeTrackerState();
}

class _TimeTrackerState extends State<TimeTracker> {
  DateTime? inDateTime;
  DateTime? outDateTime;
  List<DateTimeRecord> dateTimeRecords = [];

  Future<void> _selectInDateTime(BuildContext context) async {
    FocusScope.of(context).unfocus(); // Hide keyboard
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        setState(() {
          inDateTime = DateTime(picked.year, picked.month, picked.day,
              pickedTime.hour, pickedTime.minute);
        });
      }
    }
  }

  Future<void> _selectOutDateTime(BuildContext context) async {
    FocusScope.of(context).unfocus(); // Hide keyboard
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        setState(() {
          outDateTime = DateTime(picked.year, picked.month, picked.day,
              pickedTime.hour, pickedTime.minute);
        });
      }
    }
  }

  void addTime() {
    if (inDateTime != null && outDateTime != null) {
      setState(() {
        dateTimeRecords.add(
            DateTimeRecord(inDateTime: inDateTime!, outDateTime: outDateTime!));
        inDateTime = null;
        outDateTime = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        title: Title(
            color: Colors.black,
            child: Text(
              "Check Today all",
              style: TextStyle(fontSize: 22),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ElevatedButton(
            //   onPressed: () => _selectInDateTime(context),
            //   child: Text(inDateTime == null
            //       ? 'Select In Date and Time'
            //       : 'In: ${inDateTime!.toString()}'),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GestureDetector(
                onTap: () => _selectInDateTime(context),
                child: Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: const [
                      Color.fromARGB(255, 141, 248, 250),
                      Color.fromARGB(255, 237, 168, 191),
                    ]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    inDateTime == null
                        ? 'Select In Date and Time'
                        : 'In: ${inDateTime!.toString()}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () => _selectOutDateTime(context),
            //   child: Text(outDateTime == null
            //       ? 'Select Out Date and Time'
            //       : 'Out: ${outDateTime!.toString()}'),
            // ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GestureDetector(
                onTap: () => _selectOutDateTime(context),
                child: Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: const [
                      Color.fromARGB(255, 141, 248, 250),
                      Color.fromARGB(255, 237, 168, 191),
                    ]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    outDateTime == null
                        ? 'Select Out Date and Time'
                        : 'Out: ${outDateTime!.toString()}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: addTime,
            //   child: Text('Add Time'),
            // ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GestureDetector(
                onTap: addTime,
                child: Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: const [
                      Color.fromARGB(255, 141, 248, 250),
                      Color.fromARGB(255, 237, 168, 191),
                    ]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                      child: Text(
                    'Add Time',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),

            const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => check_all()),
            //     );
            //   },
            //   // checkAll,
            //   child: const Text('Check All'),
            // ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => check_all()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: const [
                      Color.fromARGB(255, 141, 248, 250),
                      Color.fromARGB(255, 237, 168, 191),
                    ]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                      child: Text(
                    'Check All',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: dateTimeRecords.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                        "In: ${dateTimeRecords[index].inDateTime.toString()}, Out: ${dateTimeRecords[index].outDateTime.toString()}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
