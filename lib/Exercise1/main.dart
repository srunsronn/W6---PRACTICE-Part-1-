import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6_practice_part1/Exercise1/providers/courses_provider.dart';
import 'package:week6_practice_part1/Exercise1/repositories/courses_mock_repository.dart';
import 'package:week6_practice_part1/Exercise1/repositories/courses_repository.dart';

import 'screens/course_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoursesProvider(repository: CoursesMockRepository()),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
      
        home: CourseListScreen(),
      ),
    );
  }
}
