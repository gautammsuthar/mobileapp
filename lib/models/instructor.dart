import 'dart:convert';

class Instructor {
  Instructor({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.about,
  });

  factory Instructor.fromMap(Map<String, dynamic> map) {
    return Instructor(
      id: map['id'].toString(),
      name: map['name'].toString(),
      photoUrl: map['photoUrl'].toString(),
      about: map['about'].toString(),
    );
  }

  factory Instructor.fromJson(String source) =>
      Instructor.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String name;
  final String photoUrl;
  final String about;

  Instructor copyWith({
    String? id,
    String? name,
    String? photoUrl,
    String? about,
  }) {
    return Instructor(
      id: id ?? this.id,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      about: about ?? this.about,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'photoUrl': photoUrl,
      'about': about,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Instructor(id: $id, name: $name, photoUrl: $photoUrl, about: $about)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Instructor &&
        other.id == id &&
        other.name == name &&
        other.photoUrl == photoUrl &&
        other.about == about;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ photoUrl.hashCode ^ about.hashCode;
  }
}
