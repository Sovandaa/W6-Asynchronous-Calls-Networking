import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w6_practices_hw/EX-1-START-CODE/provider/courses_provider.dart';
import '../models/course_model.dart';
import 'course_score_form.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.courseId});

  final String courseId;

  Color scoreColor(double score) {
    return score > 50 ? Colors.green : Colors.orange;
  }

  void _addScore(BuildContext context) async {
    final coursesProvider = context.read<CoursesProvider>();  // just call addscore, not listen change(not rebuild)
    
    CourseScore? newScore = await Navigator.of(context).push<CourseScore>(
      MaterialPageRoute(builder: (ctx) => const CourseScoreForm()),
    );
    
    if (newScore != null) {
      coursesProvider.addScore(courseId, newScore); 
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<CoursesProvider>(
      builder: (context, coursesProvider,child){

        Course? course = coursesProvider.getCourseFor(courseId);  

        Widget content = const Center(child: Text('No Scores added yet.'));

        if (course!.scores.isNotEmpty) {
          content = ListView.builder(
            itemCount: course.scores.length,
            itemBuilder:
                (ctx, index) => ListTile(
                  title: Text(course.scores[index].studentName),
                  trailing: Text(
                    course.scores[index].studenScore.toString(),
                    style: TextStyle(
                      color: scoreColor(course.scores[index].studenScore),
                      fontSize: 15,
                    ),
                  ),
                ),
          );
        }

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: mainColor,
            title: Text(
              course.name,
              style: const TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(onPressed: () => _addScore(context), icon: const Icon(Icons.add)),
            ],
          ),
          body: content,
        );
      }
    );
  }
}

