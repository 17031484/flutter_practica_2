class ProfileModel {
  int? id;
  String? nombre;
  String? a_paterno;
  String? a_materno;
  String? tel;
  String? email;
  String? foto;

  ProfileModel(
      {this.id,
      this.nombre,
      this.a_paterno,
      this.a_materno,
      this.tel,
      this.email,
      this.foto});

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
        id: map['id'],
        nombre: map['nombre'],
        a_paterno: map['a_paterno'],
        a_materno: map['a_materno'],
        tel: map['tel'],
        email: map['email'],
        foto: map['foto']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'a_paterno': a_paterno,
      'a_materno': a_materno,
      'tel': tel,
      'email': email,
      'foto': foto
    };
  }
}
