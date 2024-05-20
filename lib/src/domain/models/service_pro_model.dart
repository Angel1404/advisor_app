import 'dart:convert';

import 'package:advisor_app/src/domain/domain.dart';

ServiceProModel serviceProModelFromJson(String str) => ServiceProModel.fromJson(json.decode(str));

String serviceProModelToJson(ServiceProModel data) => json.encode(data.toJson());

class ServiceProModel {
  final String? id;
  final String title;
  final String description;
  final double fee;
  final double? offer;
  final StateService status;
  final String idUser;
  final String? nameClient;
  final String? nameProfesional;
  final String? idProfesional;
  final String createdAt;
  final int? rate;
  final String phoneUser, phoneProfesional;

  ServiceProModel({
    this.id,
    required this.title,
    required this.description,
    required this.fee,
    this.offer,
    this.status = StateService.none,
    required this.idUser,
    this.idProfesional,
    required this.createdAt,
    this.nameClient,
    this.nameProfesional,
    this.rate,
    required this.phoneUser,
    required this.phoneProfesional,
  });

  ServiceProModel copyWith({
    String? id,
    String? title,
    String? description,
    double? fee,
    double? offer,
    StateService? status,
    String? idUser,
    String? idProfesional,
    String? createdAt,
    String? nameClient,
    String? nameProfesional,
    String? phoneUser,
    String? phoneProfesional,
    int? rate,
  }) =>
      ServiceProModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        fee: fee ?? this.fee,
        offer: offer ?? this.offer,
        status: status ?? this.status,
        idUser: idUser ?? this.idUser,
        idProfesional: idProfesional ?? this.idProfesional,
        createdAt: createdAt ?? this.createdAt,
        nameClient: nameClient ?? this.nameClient,
        nameProfesional: nameProfesional ?? this.nameProfesional,
        rate: rate ?? this.rate,
        phoneUser: phoneUser ?? this.phoneUser,
        phoneProfesional: phoneProfesional ?? this.phoneProfesional,
      );

  factory ServiceProModel.fromJson(Map<String, dynamic> json) => ServiceProModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        fee: json["fee"],
        offer: json["offer"],
        status: StateService.stringToStateService(json["status"]),
        idUser: json["id_user"],
        idProfesional: json["id_profesional"],
        createdAt: json["created_at"],
        nameProfesional: json["name_profesional"],
        nameClient: json["name_client"],
        rate: json["rate"],
        phoneUser: json["phone_user"] ?? "",
        phoneProfesional: json["phone_profesional"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "fee": fee,
        "offer": offer,
        "status": status.status,
        "id_user": idUser,
        "id_profesional": idProfesional,
        "created_at": createdAt,
        "name_profesional": nameProfesional,
        "name_client": nameClient,
        "rate": rate,
        "phone_profesional": phoneProfesional,
        "phone_user": phoneUser,
      };
}
