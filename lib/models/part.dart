class Part {
  final String id;
  final String title;
  bool isCompleted;

  Part({required this.id, required this.title, this.isCompleted = false});

  factory Part.fromJson(Map<String, dynamic> json) {
    return Part(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'isCompleted': isCompleted};
  }
}
