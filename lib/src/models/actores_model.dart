class ActoresModel {
  String? name;
  String? profile_path;
  String? character;

  ActoresModel({this.name, this.profile_path, this.character});

  factory ActoresModel.fromMap(Map<String, dynamic> map) {
    return ActoresModel(
      name: map['name'],
      profile_path: map['profile_path'],
      character: map['character'],
    );
  }
}
