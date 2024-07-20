import 'package:bus_transportation/Student/student_detail_page.dart';
import 'package:bus_transportation/Utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  List<dynamic> studentList = [];
  List<dynamic> filteredList = [];
  Map<String, dynamic>? _recentlyDeletedStudent;
  int? _recentlyDeletedStudentIndex;

  Future<void> callStudentListApi() async {
    http.Response res = await http.get(
      Uri.parse("https://64e1bfd7ab00373588186085.mockapi.io/studentlist"),
    );
    if (res.statusCode == 200) {
      setState(() {
        studentList = jsonDecode(res.body);
        filteredList = studentList;
      });
    }
  }

  Future<void> deleteStudentFromApi(String id) async {
    final http.Response response = await http.delete(
      Uri.parse("https://64e1bfd7ab00373588186085.mockapi.io/studentlist/$id"),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete student');
    }
  }

  void filterSearchResults(String query) {
    List<dynamic> dummyList = [];
    if (query.isNotEmpty) {
      dummyList.addAll(studentList.where((student) {
        return student['name']
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList());
      setState(() {
        filteredList = dummyList;
      });
    } else {
      setState(() {
        filteredList = studentList;
      });
    }
  }

  Future<bool?> showDeleteConfirmationDialog(int index) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this student?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                _recentlyDeletedStudent = filteredList[index];
                _recentlyDeletedStudentIndex = index;
                setState(() {
                  filteredList.removeAt(index);
                });
                Navigator.of(context).pop(true);
                deleteStudentWithUndo(_recentlyDeletedStudent!);
              },
            ),
          ],
        );
      },
    );
  }

  void deleteStudentWithUndo(Map<String, dynamic> student) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Student deleted'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              filteredList.insert(_recentlyDeletedStudentIndex!, _recentlyDeletedStudent!);
              studentList.insert(_recentlyDeletedStudentIndex!, _recentlyDeletedStudent!);
            });
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    ).closed.then((reason) {
      if (reason != SnackBarClosedReason.action) {
        deleteStudentFromApi(student['id']);
      }
    });
  }

  List<Widget> getListTiles(List<dynamic> lst) {
    List<Widget> list = [];
    for (int i = 0; i < lst.length; i++) {
      list.add(
        Dismissible(
          key: Key(lst[i]['id'].toString()),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          confirmDismiss: (direction) async {
            return await showDeleteConfirmationDialog(i);
          },
          child: Row(
            children: [
              Container(
                width: 5,
                color: Colors.purple,
              ),
              Expanded(
                child: Card(
                  elevation: 5,
                  color: CustomColors.headingColors,
                  margin: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentDetailPage(student: lst[i]),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.network(
                          lst[i]["avatar"].toString(),
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      subtitle: Text(
                        "${lst[i]["semester"]} | ${lst[i]["branch"]} | ${lst[i]["rollnumber"]}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      title: Text(
                        lst[i]["name"].toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    callStudentListApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Student List",
            style: TextStyle(color: CustomColors.headingColors),
          ),
        ),
        body: Column(
          children: [
            //Search By name
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Search',
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 600,
                child: RefreshIndicator(
                  onRefresh: () async {
                    callStudentListApi();
                  },
                  child: ListView(
                    children: getListTiles(filteredList),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
