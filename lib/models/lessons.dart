import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mobileapp/models/faq.dart';

class Lesson {
  Lesson({
    required this.id,
    required this.videoLink,
    required this.description,
    required this.faqs,
    required this.doubtResolveLink,
  });

  factory Lesson.fromJson(String source) =>
      Lesson.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      id: map['id'].toString(),
      videoLink: map['videoLink'].toString(),
      description: map['description'].toString(),
      faqs: List<FaqModel>.from(
        (map['faqs'] as List<Map<String, dynamic>>)
            .map((Map<String, dynamic> x) => FaqModel.fromMap(x)),
      ),
      doubtResolveLink: map['doubtResolveLink'].toString(),
    );
  }

  Lesson copyWith({
    String? id,
    String? videoLink,
    String? description,
    List<FaqModel>? faqs,
    String? doubtResolveLink,
  }) {
    return Lesson(
      id: id ?? this.id,
      videoLink: videoLink ?? this.videoLink,
      description: description ?? this.description,
      faqs: faqs ?? this.faqs,
      doubtResolveLink: doubtResolveLink ?? this.doubtResolveLink,
    );
  }

  final String id;
  final String videoLink;
  final String description;
  final List<FaqModel> faqs;
  final String doubtResolveLink;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'videoLink': videoLink,
      'description': description,
      'faqs': faqs.map((x) => x.toMap()).toList(),
      'doubtResolveLink': doubtResolveLink,
    };
  }

  String toJson() => json.encode(toMap());
  @override
  String toString() {
    return 'Lesson(id: $id, videoLink: $videoLink, description: $description, faqs: $faqs, doubtResolveLink: $doubtResolveLink)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Lesson &&
        other.id == id &&
        other.videoLink == videoLink &&
        other.description == description &&
        listEquals(other.faqs, faqs) &&
        other.doubtResolveLink == doubtResolveLink;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        videoLink.hashCode ^
        description.hashCode ^
        faqs.hashCode ^
        doubtResolveLink.hashCode;
  }
}
