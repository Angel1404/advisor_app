enum RoleType {
  user("Usuario"),
  profesional("Profesional");

  final String role;
  const RoleType(this.role);

  static RoleType strToRoleType(String role) {
    switch (role) {
      case "Usuario":
        return RoleType.user;
      case "Profesional":
        return RoleType.profesional;

      default:
        return RoleType.user;
    }
  }
}
