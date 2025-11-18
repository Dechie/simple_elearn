// lib/screens/course_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_elearn/providers/course_provider.dart';
import 'package:simple_elearn/providers/theme_provider.dart';
import 'package:simple_elearn/screens/course_detail_screen.dart';
import 'package:simple_elearn/widgets/course_card.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final provider = context.watch<CourseProvider>();
    final courses = provider.courses;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Courses',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            tooltip: themeProvider.isDarkMode
                ? 'Switch to Light Mode'
                : 'Switch to Dark Mode',
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
          SizedBox(width: 8),
        ],
      ),
      body: courses.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return CourseCard(
                  title: course.title,
                  gradeLevel: course.gradeLevel,
                  progress: course.progress,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CourseDetailScreen(course: course),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
