import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w6_practices_hw/EX-1-START-CODE/provider/courses_provider.dart';
import '../models/course_model.dart';
import 'course_screen.dart';

const Color mainColor = Colors.blue;

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  
  // method to handle onEdit in course
  void _editCourse(BuildContext context, String courseId) async{
    await Navigator.of(context).push<Course>(
        MaterialPageRoute(
            builder: (context) => CourseScreen(courseId: courseId) // push course id 
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoursesProvider>(
      builder: (context, coursesProvider,child){

      List<Course> courseList = coursesProvider.getCourses;

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: mainColor,
          title: const Text('SCORE APP', style: TextStyle(color: Colors.white)),
        ),
        body: ListView.builder(
          itemCount: courseList.length,
          itemBuilder: (ctx, index) => Dismissible(
            key: Key(courseList[index].id),
            child: CourseTile(
              course: courseList[index],
              onEdit: _editCourse,
            ),
          ),
        ),
      );
    });
  }
}

class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course, required this.onEdit});

  final Course course;
  final Function(BuildContext, String) onEdit;

  int get numberOfScores => course.scores.length;

  String get numberText {
    return course.hasScore ? "$numberOfScores scores" : 'No score';
  }

  String get averageText {
    String average = course.average.toStringAsFixed(1);
    return course.hasScore ? "Average : $average" : '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap: () => onEdit(context, course.id),
            title: Text(course.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(numberText), Text(averageText)],
            ),
          ),
        ),
      ),
    );
  }
}
