import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MonthlyStatementPage(),
//   ));
// }

class Entry {
  final String date;
  final String inTime;
  final String outTime;
  final double totalHours;

  Entry({
    required this.date,
    required this.inTime,
    required this.outTime,
    required this.totalHours,
  });
}

class MonthlyStatementPage extends StatefulWidget {
  @override
  _MonthlyStatementPageState createState() => _MonthlyStatementPageState();
}

class _MonthlyStatementPageState extends State<MonthlyStatementPage> {
  List<Entry> entries = [
    Entry(
        date: '01/01/2022',
        inTime: '09:00 AM',
        outTime: '05:00 PM',
        totalHours: 8.0),
    Entry(
        date: '01/02/2022',
        inTime: '08:30 AM',
        outTime: '04:45 PM',
        totalHours: 8.25),
    // Add more sample entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        title: Title(
            color: Colors.black,
            child: Text(
              "Monthly wise all",
              style: TextStyle(fontSize: 22),
            )),
      ),
      body: ListView.builder(
        itemCount: entries.length + 1, // +1 for headline
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildHeadlineRow();
          }
          Entry entry = entries[index - 1];
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(entry.date),
                Text(entry.inTime),
                Text(entry.outTime),
                Text(entry.totalHours.toStringAsFixed(2)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to page for entering new data
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEntryPage()),
          ).then((newEntry) {
            if (newEntry != null) {
              setState(() {
                entries.add(newEntry);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildHeadlineRow() {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Date'),
          Text('In Time'),
          Text('Out Time'),
          Text('Total Hours'),
        ],
      ),
    );
  }
}

class AddEntryPage extends StatefulWidget {
  @override
  _AddEntryPageState createState() => _AddEntryPageState();
}

class _AddEntryPageState extends State<AddEntryPage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController inTimeController = TextEditingController();
  TextEditingController outTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Entry'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: inTimeController,
              decoration: InputDecoration(labelText: 'In Time'),
            ),
            TextField(
              controller: outTimeController,
              decoration: InputDecoration(labelText: 'Out Time'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add new entry and pass it back to previous page
                Navigator.pop(
                  context,
                  Entry(
                    date: dateController.text,
                    inTime: inTimeController.text,
                    outTime: outTimeController.text,
                    totalHours: _calculateTotalHours(
                      inTimeController.text,
                      outTimeController.text,
                    ),
                  ),
                );
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateTotalHours(String inTime, String outTime) {
    return 8.0;
  }
}
