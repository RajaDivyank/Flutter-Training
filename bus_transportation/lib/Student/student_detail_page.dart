import 'package:flutter/material.dart';
import '../Utilities/utilities.dart';
class StudentDetailPage extends StatelessWidget {
  final Map student;

  const StudentDetailPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xFFE57373),
        backgroundColor: Colors.deepPurpleAccent,
        // appBar: AppBar(
        //   title: const Text("Student Details"),
        //   backgroundColor: CustomColors.themeColors,
        //   automaticallyImplyLeading: true,
        // ),
        body: Column(
          children: [
            const SizedBox(height: 30),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(student["avatar"].toString()),
              ),
            ),
            // const SizedBox(height: ),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Not Registered',
                  style: TextStyle(color: Colors.white,fontWeight: CustomFontWeights.commonFonts),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    student["name"].toString(),
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: CustomFontWeights.boldFonts,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    student["rollnumber"].toString(),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: CustomFontWeights.commonFonts,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${student["branch"]} | ${student["semester"]} | ${student["rollnumber"]}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: CustomFontWeights.commonFonts,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    _buildInfoRow('Bus Pass No.', '-'),
                    const SizedBox(height: 10),
                    _buildInfoRow('Bus Pass Validity', '-'),
                    const SizedBox(height: 10),
                    _buildInfoRow('Route', '-'),
                    const SizedBox(height: 10),
                    _buildInfoRow('Pickup Point', '-'),
                    const SizedBox(height: 80),
                    Center(
                      child: CustomButton(
                        text: "Submit",
                        onPressed: () {
                          // Add your submit logic here
                        },
                        width: double.infinity,
                        height: 50.0,
                        color: CustomColors.themeColors,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        borderRadius: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: CustomFontWeights.commonFonts,
              color: Colors.grey),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
              fontSize: 18, fontWeight: CustomFontWeights.boldFonts),
        ),
        const Divider(),
      ],
    );
  }
}
