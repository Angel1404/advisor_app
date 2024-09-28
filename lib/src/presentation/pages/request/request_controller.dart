import 'package:advisor_app/src/presentation/presentation.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

class RequestController extends GetxController {
  RequestController({
    required ServicesProfesional servicesProfesional,
    required LocalPreferences localPreferences,
  })  : _servicesProfesional = servicesProfesional,
        _localPreferences = localPreferences;

  static RequestController get to => Get.find<RequestController>();

  final ServicesProfesional _servicesProfesional;
  final LocalPreferences _localPreferences;

  final listServices = RxList<ServiceProModel>([]);

  getAllService() {
    if (_localPreferences.getUserRole == RoleType.profesional) {
      try {
        _servicesProfesional.getAll().listen((data) {
          if (data.docs.isNotEmpty) {
            listServices.value = data.docs.map((e) => ServiceProModel.fromJson(e.data())).toList();
          } else {
            listServices.value = [];
          }
        });
      } catch (e) {
        debugPrint(e.toString());
        listServices.value = [];
      }
    }
  }

  Future<GenericResponse> updateStateService({required String idService, required StateService status}) async {
    try {
      await _servicesProfesional.updateService(idService: idService, status: status);
      return GenericResponse();
    } catch (e) {
      return GenericResponse.errorStr(e.toString());
    }
  }

  Future<GenericResponse> acceptService({required String idService}) async {
    try {
      await _servicesProfesional.acceptService(
        idService: idService,
        idProfesional: _localPreferences.getUserId!,
        nameProfesional: _localPreferences.getUserName!,
        phoneProfesional: HomeViewController.to.userData.value.phone,
      );
      return GenericResponse();
    } catch (e) {
      return GenericResponse.errorStr(e.toString());
    }
  }

  Future<GenericResponse> offerService({required String idService, required String offerAmount}) async {
    try {
      await _servicesProfesional.offerService(
        idService: idService,
        offerAmount: double.parse(offerAmount),
        idProfesional: _localPreferences.getUserId!,
        nameProfesional: _localPreferences.getUserName!,
        phoneProfesional: HomeViewController.to.userData.value.phone,
      );

      return GenericResponse();
    } catch (e) {
      return GenericResponse.errorStr(e.toString());
    }
  }
}
