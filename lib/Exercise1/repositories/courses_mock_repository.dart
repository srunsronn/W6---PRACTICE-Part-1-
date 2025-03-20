import 'package:week6_practice_part1/Exercise1/models/course.dart';
import 'package:week6_practice_part1/Exercise1/repositories/courses_repository.dart';

class CoursesMockRepository extends CoursesRepository{

  final List<Course> _courses = [
    Course(name: 'UX/UI'),
    Course(name: 'C#')
  ];

  List<Course> getCourses(){
   return _courses;
  }
  
  @override
  void addScore(Course course, CourseScore score) {
    course.addScore(score);
  }
}