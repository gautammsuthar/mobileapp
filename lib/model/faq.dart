import 'dart:convert';

class FaqModel {
  FaqModel({
    required this.title,
    required this.description,
  });
  factory FaqModel.fromMap(Map<String, dynamic> map) {
    return FaqModel(
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }
  factory FaqModel.fromJson(String source) =>
      FaqModel.fromMap(json.decode(source) as Map<String, dynamic>);
  final String title;
  final String description;

  FaqModel copyWith({
    String? title,
    String? description,
  }) {
    return FaqModel(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'FaqModel(title: $title, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FaqModel &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}
