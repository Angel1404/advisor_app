enum StateService {
  none("Sin asignación"),
  aceepted("Aceptado"),
  canceled("Cancelado"),
  completed("Completado");

  const StateService(this.status);
  final String status;

  static stringToStateService(String status) {
    switch (status) {
      case "Sin asignación":
        return StateService.none;
      case "Aceptado":
        return StateService.aceepted;
      case "Cancelado":
        return StateService.canceled;
      case "Completado":
        return StateService.completed;

      default:
        return StateService.none;
    }
  }
}
