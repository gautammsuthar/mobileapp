// title
// List <Lessons>

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mobileapp/models/lessons.dart';

class Section {
  Section({
    required this.id,
    required this.title,
    required this.lesson,
  });

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      id: map['id'].toString(),
      title: map['title'].toString(),
      lesson: List<Lesson>.from((map['lesson'] as List<Map<String, dynamic>>)
          .map((x) => Lesson.fromMap(x))),
    );
  }

  factory Section.fromJson(String source) =>
      Section.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String title;
  final List<Lesson> lesson;
  Section copyWith({
    String? id,
    String? title,
    List<Lesson>? lesson,
  }) {
    return Section(
      id: id ?? this.id,
      title: title ?? this.title,
      lesson: lesson ?? this.lesson,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'lesson': lesson.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'Section(id: $id, title: $title, lesson: $lesson)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Section &&
        other.id == id &&
        other.title == title &&
        listEquals(other.lesson, lesson);
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ lesson.hashCode;
}
