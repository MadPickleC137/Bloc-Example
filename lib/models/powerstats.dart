import 'dart:convert';

class Powerstats {
  String name;
  String intelligence;
  String strength;
  String speed;
  String durability;
  String power;
  String combat;

  Powerstats({
    required this.name,
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  Powerstats copyWith({
    String? name,
    String? intelligence,
    String? strength,
    String? speed,
    String? durability,
    String? power,
    String? combat,
  }) {
    return Powerstats(
      name: name ?? this.name,
      intelligence: intelligence ?? this.intelligence,
      strength: strength ?? this.strength,
      speed: speed ?? this.speed,
      durability: durability ?? this.durability,
      power: power ?? this.power,
      combat: combat ?? this.combat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'intelligence': intelligence,
      'strength': strength,
      'speed': speed,
      'durability': durability,
      'power': power,
      'combat': combat,
    };
  }

  factory Powerstats.fromMap(Map<String, dynamic> map) {
    return Powerstats(
      name: map['name'] ?? '',
      intelligence: map['intelligence'] ?? '',
      strength: map['strength'] ?? '',
      speed: map['speed'] ?? '',
      durability: map['durability'] ?? '',
      power: map['power'] ?? '',
      combat: map['combat'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Powerstats.fromJson(String source) =>
      Powerstats.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Powerstats(name: $name, intelligence: $intelligence, strength: $strength, speed: $speed, durability: $durability, power: $power, combat: $combat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Powerstats &&
        other.name == name &&
        other.intelligence == intelligence &&
        other.strength == strength &&
        other.speed == speed &&
        other.durability == durability &&
        other.power == power &&
        other.combat == combat;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        intelligence.hashCode ^
        strength.hashCode ^
        speed.hashCode ^
        durability.hashCode ^
        power.hashCode ^
        combat.hashCode;
  }
}
