class ContainingPlace {
  String? name;
  String? id;

  ContainingPlace({this.name, this.id});

  factory ContainingPlace.fromJson(Map<String, dynamic> json) {
    return ContainingPlace(
      name: json['name'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'id': id};
  }
}
