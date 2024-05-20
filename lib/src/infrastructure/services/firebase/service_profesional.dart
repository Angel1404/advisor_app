import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../domain/models/states_services_enum.dart';

class ServicesProfesional {
  static ServicesProfesional get to => Get.find<ServicesProfesional>();

  final nameCollection = "services_pro";
  final _cloudFirebase = FirebaseFirestore.instance;

  Future create(Map<String, dynamic> data) async {
    try {
      await _cloudFirebase.collection(nameCollection).add(data).then((doc) => doc.update({"id": doc.id}));
    } catch (e) {
      throw e.toString();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAll() {
    try {
      return _cloudFirebase.collection(nameCollection).snapshots();
    } catch (e) {
      throw e.toString();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get(String idUser) {
    try {
      return _cloudFirebase
          .collection(nameCollection)
          .where("id_user", isEqualTo: idUser)
          .where("status", whereIn: [StateService.aceepted.status, StateService.none.status]).snapshots();
    } catch (e) {
      throw e.toString();
    }
  }

  Future getByRol(String role, String idUser) async {
    try {} catch (e) {
      throw e.toString();
    }
  }

  Future acceptService({
    required String idService,
    required String idProfesional,
    required String nameProfesional,
    required String phoneProfesional,
  }) async {
    try {
      return _cloudFirebase.collection(nameCollection).doc(idService).update({
        "status": StateService.aceepted.status,
        "id_profesional": idProfesional,
        "name_profesional": nameProfesional,
        "phone_profesional": phoneProfesional,
      });
    } catch (e) {
      throw e.toString();
    }
  }

  Future updateService({required String idService, required StateService status}) async {
    try {
      return _cloudFirebase.collection(nameCollection).doc(idService).update({
        "status": status.status,
      });
    } catch (e) {
      throw e.toString();
    }
  }

  Future offerService({
    required String idService,
    required double offerAmount,
    required String idProfesional,
    required String nameProfesional,
    required String phoneProfesional,
  }) async {
    try {
      return _cloudFirebase.collection(nameCollection).doc(idService).update({
        "offer": offerAmount,
        "name_profesional": nameProfesional,
        "id_profesional": idProfesional,
        "phone_profesional": phoneProfesional,
      });
    } catch (e) {
      throw e.toString();
    }
  }

  Future acceptOfferService({required String idService, required double offerAmount}) async {
    try {
      return _cloudFirebase.collection(nameCollection).doc(idService).update({
        "offer": null,
        "fee": offerAmount,
      });
    } catch (e) {
      throw e.toString();
    }
  }

  Future rejectOfferService({required String idService}) async {
    try {
      return _cloudFirebase.collection(nameCollection).doc(idService).update({
        "offer": null,
        "id_profesional": null,
        "name_profesional": null,
        "phone_profesional": "",
      });
    } catch (e) {
      throw e.toString();
    }
  }

  rateService({required String idService, int? rate, String? comment}) async {
    try {
      return _cloudFirebase.collection(nameCollection).doc(idService).update({
        "rate": rate,
        "comment": comment,
      });
    } catch (e) {
      throw e.toString();
    }
  }
}
