import 'package:w6_practices_hw/EX-1-START-CODE/models/course_model.dart';
import 'package:w6_practices_hw/EX-1-START-CODE/repository/courses_repository.dart';

class CoursesMockRepository implements CoursesRepository {
  
  // initailize data, list of courses
  List<Course> allCourses = [
    Course(name: "HTML", id: "001"),
    Course(name: "JAVA", id: "002"),
    Course(name: "FLUTTER", id: "003")
  ];

  // add score to course by id course
  @override
  void addScore(Course course, CourseScore score) {
    for (var aCourse in allCourses) {
      if (aCourse.id == course.id) {
        aCourse.addScore(score);
      }
    }
  }

  // return a list of courses
  @override
  List<Course> getCourses() {
    return allCourses;
  }
}
