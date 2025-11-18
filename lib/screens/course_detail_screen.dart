// lib/screens/course_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_elearn/models/course.dart';
import 'package:simple_elearn/providers/course_provider.dart';
import 'package:simple_elearn/widgets/part_item.dart';
import 'package:simple_elearn/widgets/progress_bar.dart';
import 'package:simple_elearn/widgets/unit_tile.dart';

import 'part_detail_screen.dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;
  const CourseDetailScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CourseProvider>();
    final updatedCourse = provider.getCourseById(course.id) ?? course;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              updatedCourse.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              updatedCourse.gradeLevel,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          ProgressBar(progress: updatedCourse.progress),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Course Contents",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8),
              itemCount: updatedCourse.units.length,
              itemBuilder: (context, index) {
                final unit = updatedCourse.units[index];
                return UnitTile(
                  title: unit.title,
                  parts: unit.parts
                      .map(
                        (part) => PartItem(
                          title: part.title,
                          isCompleted: part.isCompleted,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => PartDetailScreen(
                                  courseId: updatedCourse.id,
                                  unitId: unit.id,
                                  partId: part.id,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
