import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_elearn/providers/course_provider.dart';
import 'package:simple_elearn/screens/course_list_screen.dart';
import 'package:simple_elearn/theme/app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CourseProvider()..loadCourses(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: CourseListScreen(),
    );
  }
}
