import 'dart:convert';

class FaqModel {
  FaqModel({
    required this.id,
    required this.title,
    required this.description,
  });
  factory FaqModel.fromMap(Map<String, dynamic> map) {
    return FaqModel(
      id: map['id'].toString(),
      title: map['title'].toString(),
      description: map['description'].toString(),
    );
  }
  factory FaqModel.fromJson(String source) =>
      FaqModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String title;
  final String description;

  FaqModel copyWith({
    String? id,
    String? title,
    String? description,
  }) {
    return FaqModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'FaqModel(id: $id, title: $title, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FaqModel &&
        other.id == id &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode;
}
