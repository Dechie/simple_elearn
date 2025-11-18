import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_elearn/providers/course_provider.dart';

class PartDetailScreen extends StatelessWidget {
  final String courseId;

  final String unitId;
  final String partId;
  const PartDetailScreen({
    super.key,
    required this.courseId,
    required this.unitId,
    required this.partId,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CourseProvider>();
    final course = provider.getCourseById(courseId);
    final unit = course?.units.firstWhere((u) => u.id == unitId);
    final part = unit?.parts.firstWhere((p) => p.id == partId);

    if (part == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('Part not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(part.title, style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Theme.of(
                          context,
                        ).primaryColor.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.book_outlined,
                          size: 48,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Learning Content',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'This is a placeholder for the learning content of "${part.title}".',
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  if (part.isCompleted)
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.green.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.green),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'You have completed this part!',
                              style: TextStyle(
                                color: Colors.green[700],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (!part.isCompleted)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CourseProvider>().markPartAsCompleted(
                        courseId,
                        unitId,
                        partId,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.white),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Part ${part.title} marked as completed!',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Mark as Completed',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
