import 'package:advisor_app/src/presentation/presentation.dart';
import 'package:get/get.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

class CreateServiceController extends GetxController {
  CreateServiceController({
    required ServicesProfesional servicesProfesional,
    required LocalPreferences localPreferences,
  })  : _servicesProfesional = servicesProfesional,
        _localPreferences = localPreferences;

  static CreateServiceController get to => Get.find<CreateServiceController>();
  final ServicesProfesional _servicesProfesional;
  final LocalPreferences _localPreferences;

  Future<GenericResponse> createService({
    required String description,
    required String title,
    required String fee,
  }) async {
    if (title.isEmpty || description.isEmpty || fee.isEmpty) {
      return GenericResponse.errorStr("Todos los datos son obligatorios");
    }

    try {
      final data = ServiceProModel(
        nameClient: _localPreferences.getUserName!,
        createdAt: DateTime.now().toString(),
        description: description,
        fee: double.parse(fee),
        idUser: _localPreferences.getUserId!,
        title: title,
        phoneUser: HomeViewController.to.userData.value.phone,
        phoneProfesional: "",
      );
      await _servicesProfesional.create(data.toJson());
      getActiveService();
      return GenericResponse();
    } catch (e) {
      return GenericResponse.errorStr(e.toString());
    }
  }

  final serviceActive = Rx<ServiceProModel?>(null);

  getActiveService() {
    if (_localPreferences.getUserRole == RoleType.user) {
      try {
        _servicesProfesional.get(_localPreferences.getUserId!).listen((data) {
          if (data.docs.isNotEmpty) {
            serviceActive.value = ServiceProModel.fromJson(data.docs.first.data());
          } else {
            serviceActive.value = null;
          }
        });
      } catch (e) {
        serviceActive.value = null;
      }
    }
  }

  Future<GenericResponse> acceptOfferService() async {
    try {
      await _servicesProfesional.acceptOfferService(idService: serviceActive.value!.id!, offerAmount: serviceActive.value!.offer!);
      await _servicesProfesional.acceptService(
        idService: serviceActive.value!.id!,
        idProfesional: serviceActive.value!.idProfesional!,
        nameProfesional: serviceActive.value!.nameProfesional!,
        phoneProfesional: serviceActive.value!.phoneProfesional,
      );
      return GenericResponse();
    } catch (e) {
      return GenericResponse.errorStr(e.toString());
    }
  }

  Future<GenericResponse> rejectOfferService() async {
    try {
      await _servicesProfesional.rejectOfferService(idService: serviceActive.value!.id!);

      return GenericResponse();
    } catch (e) {
      return GenericResponse.errorStr(e.toString());
    }
  }

  Future<GenericResponse> completedService() async {
    try {
      await _servicesProfesional.updateService(
        idService: serviceActive.value!.id!,
        status: StateService.completed,
      );

      return GenericResponse();
    } catch (e) {
      return GenericResponse.errorStr(e.toString());
    }
  }

  Future<GenericResponse> rateService({String? comment, int? rate, required String idService}) async {
    try {
      await _servicesProfesional.rateService(idService: idService, comment: comment, rate: rate);

      return GenericResponse();
    } catch (e) {
      return GenericResponse.errorStr(e.toString());
    }
  }
}
