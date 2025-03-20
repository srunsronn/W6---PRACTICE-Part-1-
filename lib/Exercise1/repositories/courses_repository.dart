import 'package:week6_practice_part1/Exercise1/models/course.dart';

abstract class CoursesRepository {
  List<Course> getCourses();
  void addScore(Course course, CourseScore score);
}