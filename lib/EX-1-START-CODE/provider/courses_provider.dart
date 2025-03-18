import 'package:flutter/material.dart';
import 'package:w6_practices_hw/EX-1-START-CODE/models/course_model.dart';
import 'package:w6_practices_hw/EX-1-START-CODE/repository/courses_repository.dart';

class CoursesProvider extends ChangeNotifier {
  final CoursesRepository repository;

  CoursesProvider({required this.repository});

  List<Course> get getCourses => repository.getCourses();

  // get course with specific course id
  Course? getCourseFor(String courseId) {
    final courses = repository.getCourses();
    for (var course in courses) {
      if (course.id == courseId) {
        return course;
      }
    }
    return null;
  }

  void addScore(String courseId, CourseScore score) {
    // get the course by courseId
    Course? course = getCourseFor(courseId);
    repository.addScore(course!, score);
    notifyListeners(); // notify listeners that has state chnage
  }
}
