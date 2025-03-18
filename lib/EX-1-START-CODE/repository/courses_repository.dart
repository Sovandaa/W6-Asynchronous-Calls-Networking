import 'package:w6_practices_hw/EX-1-START-CODE/models/course_model.dart';

abstract class CoursesRepository {
  List<Course> getCourses();
  void addScore(Course course, CourseScore score);
}
