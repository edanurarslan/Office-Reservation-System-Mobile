enum UserRole {
  employee(1, 'Employee', 'Çalışan'),
  manager(2, 'Manager', 'Yönetici'),
  admin(3, 'Admin', 'Admin');

  final int value;
  final String name;
  final String displayName;

  const UserRole(this.value, this.name, this.displayName);

  static UserRole fromString(String role) {
    switch (role.toLowerCase()) {
      case 'admin':
        return UserRole.admin;
      case 'manager':
        return UserRole.manager;
      case 'employee':
      default:
        return UserRole.employee;
    }
  }

  static UserRole fromValue(int value) {
    switch (value) {
      case 3:
        return UserRole.admin;
      case 2:
        return UserRole.manager;
      case 1:
      default:
        return UserRole.employee;
    }
  }

  bool get isEmployee => this == UserRole.employee;
  bool get isManager => this == UserRole.manager;
  bool get isAdmin => this == UserRole.admin;
  
  bool get canManageReservations => isManager || isAdmin;
  bool get canManageUsers => isAdmin;
  bool get canViewReports => isManager || isAdmin;
  bool get canManageResources => isManager || isAdmin;
  bool get canManageRooms => isManager || isAdmin;
}
