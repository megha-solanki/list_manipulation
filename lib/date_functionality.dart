import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFunctionality extends StatefulWidget {
  const DateFunctionality({super.key});

  @override
  State<DateFunctionality> createState() => _DateFunctionalityState();
}

class _DateFunctionalityState extends State<DateFunctionality> {
  DateTime? fromDate;
  DateTime? toDate;
  List<DateTime> mondayList=[];

  Future<void> selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != fromDate) {
      setState(() {
        fromDate = picked;

      });
      updateMondays();
    }
  }

  Future<void> selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        initialDate: toDate ?? DateTime.now());
    if (picked != null && picked != toDate) {
      setState(() {
        toDate = picked;

      });
      updateMondays();
    }
  }

  void updateMondays() {
    DateTime current = fromDate!.add(Duration(days: DateTime.monday - fromDate!.weekday));
    while (current.isBefore(toDate!)) {
      mondayList.add(current);
      current = current.add(const Duration(days: 7));
    }
  }

  String formatDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date Operation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("From Date :"),
            Row(
              children: [
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      selectFromDate(context);
                    },
                    child: const Text("Select From Date"),
                  ),
                ),
                const SizedBox(width: 16),
                Text(fromDate != null ? formatDate(fromDate!) : 'Not selected'),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'To Date:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => selectToDate(context),
                  child: const Text('Select To Date'),
                ),
                const SizedBox(width: 16),
                Text(toDate != null ? formatDate(toDate!) : 'Not selected'),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Mondays Between Dates:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
          fromDate !=null && toDate !=null?  Column(
              children: mondayList.map((e) {
                return Text(
                  formatDate(e),
                );
              }).toList(),
            )
              :const Text("Select from date and to date")
          ],
        ),
      ),
    );
  }
}
