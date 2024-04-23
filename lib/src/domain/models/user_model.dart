class UserModelEntitie {
  final String name;
  final String apells;
  final String email;
  final String id;
  final String phone;
  final String rol;

  UserModelEntitie({
    this.apells = '',
    this.email = '',
    this.id = '',
    this.name = '',
    this.phone = '',
    this.rol = '',
  });

  factory UserModelEntitie.fromJson(Map<String, dynamic> json) {
    return UserModelEntitie(
      email: json['email'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      apells: json['apells'] ?? '',
      phone: json['phone'] ?? '',
      rol: json['rol'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'apells': apells,
      'email': email,
      'id': id,
      'name': name,
      'phone': phone,
      'rol': rol,
    };
  }
}
