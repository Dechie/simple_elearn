import 'unit.dart';

class Course {
  final String id;
  final String title;
  final String gradeLevel;
  final List<Unit> units;

  Course({
    required this.id,
    required this.title,
    required this.gradeLevel,
    required this.units,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      gradeLevel: json['gradeLevel'],
      units: (json['units'] as List)
          .map((unit) => Unit.fromJson(unit))
          .toList(),
    );
  }

  int get completedParts {
    int completedParts = 0;

    for (var unit in units) {
      completedParts += unit.completedPartsCount;
    }
    return completedParts;
  }

  double get progress {
    return totalParts > 0 ? (completedParts / totalParts) * 100 : 0;
  }

  int get totalParts {
    var totalP = 0;
    for (var unit in units) {
      totalP += unit.parts.length;
    }
    return totalP;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'gradeLevel': gradeLevel,
      'units': units.map((unit) => unit.toJson()).toList(),
    };
  }
}
