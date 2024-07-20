import 'package:bus_transportation/Utilities/utilities.dart';
import 'package:flutter/material.dart';

class ReportListPage extends StatefulWidget {
  const ReportListPage({super.key});

  @override
  State<ReportListPage> createState() => _ReportListPageState();
}

class _ReportListPageState extends State<ReportListPage> {
  DateTime? fromDate;
  DateTime? toDate;

  Future<void> _selectDate(BuildContext context, bool isFrom) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 1),
      lastDate: DateTime(2024, 12),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reported List (204)',style: TextStyle(color: CustomColors.headingColors),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('From'),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => _selectDate(context, true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            fromDate != null
                                ? '${fromDate!.day.toString().padLeft(2, '0')}/${fromDate!.month.toString().padLeft(2, '0')}/${fromDate!.year}'
                                : 'Select date',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('To'),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => _selectDate(context, false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            toDate != null
                                ? '${toDate!.day.toString().padLeft(2, '0')}/${toDate!.month.toString().padLeft(2, '0')}/${toDate!.year}'
                                : 'Select date',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(""),
                      const SizedBox(height: 5,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.themeColors,
                        ),
                        onPressed: () {
                          // Implement search functionality
                        },
                        child: const Text('Search',style: TextStyle(color: CustomColors.headingColors),),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: reportedList.length,
                  itemBuilder: (context, index) {
                    final report = reportedList[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bus No. ${report['busNo']} | ${report['date']} ${report['time']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(report['name']!),
                            const SizedBox(height: 4),
                            Text(
                              report['incident']!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Map<String, String>> reportedList = [
  {
    'busNo': '20',
    'date': '04/01/2023',
    'time': '04:02',
    'name': 'Jani Kruti Dushyantbhai (22010302001)',
    'incident': 'Traveling without paying bus fees',
  },
  {
    'busNo': '20',
    'date': '04/01/2023',
    'time': '04:02',
    'name': 'Mehta Princy Yogeshbhai (22010301002)',
    'incident': 'Traveling without paying bus fees',
  },
  {
    'busNo': '17',
    'date': '05/01/2023',
    'time': '01:59',
    'name': 'Jakasanitya Krupali Shailesh (190540107076)',
    'incident': 'Traveling without paying bus fees',
  },
  {
    'busNo': '17',
    'date': '05/01/2023',
    'time': '02:00',
    'name': 'Varasada Hasti (190540107218)',
    'incident': 'Traveling without paying bus fees',
  },
];