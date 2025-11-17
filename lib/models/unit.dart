import 'part.dart';

class Unit {
  final String id;
  final String title;
  final List<Part> parts;

  Unit({required this.id, required this.title, required this.parts});

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      id: json['id'],
      title: json['title'],
      parts: (json['parts'] as List)
          .map((part) => Part.fromJson(part))
          .toList(),
    );
  }

  int get completedPartsCount {
    return parts.where((part) => part.isCompleted).length;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'parts': parts.map((part) => part.toJson()).toList(),
    };
  }
}
