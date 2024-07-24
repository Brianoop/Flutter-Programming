import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     home: CourseListScreen(),
    //  home: TestScreen(),
    );
  }
}





class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  _CourseListScreenState createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  List<String> _courses = [];
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _courses = prefs.getStringList('courses') ?? [];
    });
  }

  Future<void> _addCourse(String course) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _courses.add(course);
      prefs.setStringList('courses', _courses);
    });
  }

  Future<void> _removeCourse(String course) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _courses.remove(course);
      prefs.setStringList('courses', _courses);
    });
  }

  Future<void> _updateCourse(String oldCourse, String newCourse) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      int index = _courses.indexOf(oldCourse);
      if (index != -1) {
        _courses[index] = newCourse;
        prefs.setStringList('courses', _courses);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Science Courses')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Course Name',
             
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _addCourse(_controller.text);
                      _controller.clear();
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _courses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_courses[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _showEditDialog(context, _courses[index]);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _removeCourse(_courses[index]);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context, String oldCourse) {
    TextEditingController editController = TextEditingController(text: oldCourse);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Course'),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(labelText: 'Course Name'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Update'),
              onPressed: () {
                if (editController.text.isNotEmpty) {
                  _updateCourse(oldCourse, editController.text);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
