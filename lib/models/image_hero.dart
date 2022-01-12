import 'dart:convert';

class ImageHero {
  String id;
  String name;
  String url;
  ImageHero({
    required this.id,
    required this.name,
    required this.url,
  });

  ImageHero copyWith({
    String? id,
    String? name,
    String? url,
  }) {
    return ImageHero(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url': url,
    };
  }

  factory ImageHero.fromMap(Map<String, dynamic> map) {
    return ImageHero(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageHero.fromJson(String source) =>
      ImageHero.fromMap(json.decode(source));

  @override
  String toString() => 'ImageHero(id: $id, name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImageHero &&
        other.id == id &&
        other.name == name &&
        other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ url.hashCode;
}
