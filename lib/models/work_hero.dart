import 'dart:convert';

class WorkHero {
  String id;
  String name;
  String occupation;
  String base;
  WorkHero({
    required this.id,
    required this.name,
    required this.occupation,
    required this.base,
  });

  WorkHero copyWith({
    String? id,
    String? name,
    String? occupation,
    String? base,
  }) {
    return WorkHero(
      id: id ?? this.id,
      name: name ?? this.name,
      occupation: occupation ?? this.occupation,
      base: base ?? this.base,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'occupation': occupation,
      'base': base,
    };
  }

  factory WorkHero.fromMap(Map<String, dynamic> map) {
    return WorkHero(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      occupation: map['occupation'] ?? '',
      base: map['base'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkHero.fromJson(String source) =>
      WorkHero.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WorkHero(id: $id, name: $name, occupation: $occupation, base: $base)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WorkHero &&
        other.id == id &&
        other.name == name &&
        other.occupation == occupation &&
        other.base == base;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ occupation.hashCode ^ base.hashCode;
  }
}
