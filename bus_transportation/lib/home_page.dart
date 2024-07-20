import 'package:bus_transportation/Report/report_list_page.dart';
import 'package:bus_transportation/Student/student_list_page.dart';
import 'package:bus_transportation/Utilities/utilities.dart';
import 'package:bus_transportation/change_bus_page.dart';
import 'package:bus_transportation/history_page.dart';
import 'package:bus_transportation/scan_barcode_page.dart';
import 'package:bus_transportation/search_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List gridViewList = [
  {
    "image": "assets/Logos/scan_barcode_logo.png",
    "content": "Scan BarCode",
    "page": const ScanBarcodePage(),
  },
  {
    "image": "assets/Logos/search_logo.png",
    "content": "Search",
    "page": const SearchPage(),
  },
  {
    "image": "assets/Logos/history_logo.png",
    "content": "History",
    "page": const HistoryPage(),
  },
  {
    "image": "assets/Logos/bus_logo.png",
    "content": "Change Bus",
    "page": const ChangeBusPage(),
  },
  {
    "image": "assets/Logos/list_logo.png",
    "content": "Student List",
    "page": const StudentListPage(),
  },
  {
    "image": "assets/Logos/list_logo.png",
    "content": "Reported List",
    "page": const ReportListPage(),
  },
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Bus Check',
            style: TextStyle(color: CustomColors.headingColors),
          ),
          // automaticallyImplyLeading: true,
          actions: [
            InkWell(
              onTap: () async {
                String shareMessage = "SHARE";
                await Share.share(shareMessage);
              },
              child: const Icon(
                size: 28.0,
                Icons.share,
                color: CustomColors.headingColors,
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            PopupMenuButton(
              iconSize: 35.0,
              iconColor: CustomColors.headingColors,
              itemBuilder: (context) => [
                PopupMenuItem(
                  height: 50,
                  onTap: () {},
                  child: const Text("Developer"),
                ),
                PopupMenuItem(
                  height: 50,
                  onTap: () {
                    dynamic uri = Uri.parse(
                        "https://play.google.com/store/apps/collection/cluster?gsr=SlhqGFE3VStsNnpFb2FodkxiQTJSclBsWWc9PbICOwoeChpjb20uamFjcGNtZXJpdG5vcHJlZGljYXRvchAHEhcIARITNTY2NzA4NDE5OTM5NzYxNzAyNBgA:S:ANO1ljJsOfg&hl=en");
                    launchUrl(
                      uri,
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: const Text("Other App"),
                )
              ],
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          decoration: const BoxDecoration(color: Colors.white),
          child: GridView.builder(
              itemCount: gridViewList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.2,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return _buildGridItem(index);
              }),
        ),
      ),
    );
  }

  Widget _buildGridItem(int index) {
    return InkWell(
      onTap: () async {
        navigate(gridViewList[index]["content"], gridViewList[index]["page"]);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 2),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  child:
                      Center(child: Image.asset(gridViewList[index]["image"])),
                ),
                Center(
                  child: Text(
                    gridViewList[index]["content"],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void navigate(content, page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
