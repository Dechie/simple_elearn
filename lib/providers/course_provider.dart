import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:simple_elearn/models/course.dart';

class CourseProvider extends ChangeNotifier {
  List<Course> _courses = [];

  List<Course> get courses => _courses;

  Future<void> loadCourses() async {
    // Load JSON from assets
    final String response = await rootBundle.loadString('assets/mock_data.json');
    final data = json.decode(response);
    _courses = (data['courses'] as List)
        .map((course) => Course.fromJson(course))
        .toList();
    notifyListeners();
  }

  Course? getCourseById(String id) {
    return _courses.firstWhere((course) => course.id == id);
  }

  void markPartAsCompleted(String courseId, String unitId, String partId) {
    final course = getCourseById(courseId);
    if (course != null) {
      final unit = course.units.firstWhere((u) => u.id == unitId);
      final part = unit.parts.firstWhere((p) => p.id == partId);
      part.isCompleted = true;
      notifyListeners();
    }
  }
}