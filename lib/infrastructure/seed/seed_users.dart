import 'package:ofis_yonetim_sistemi/domain/entities/user.dart';

/// Seed kullanıcılar - Geliştirme ve test için
/// NOT: Bu verilerin .NET backend'de de aynı şekilde olması gerekir
class SeedUsers {
  /// Admin kullanıcısı
  static final User adminUser = User(
    id: '1',
    email: 'admin@ofis.com',
    firstName: 'Admin',
    lastName: 'User',
    roles: ['admin'],
    department: 'Yönetim',
    jobTitle: 'Sistem Yöneticisi',
    createdAt: DateTime(2025, 1, 1),
    isActive: true,
  );

  /// Manager kullanıcısı
  static final User managerUser = User(
    id: '2',
    email: 'manager@ofis.com',
    firstName: 'Manager',
    lastName: 'User',
    roles: ['manager'],
    department: 'İnsan Kaynakları',
    jobTitle: 'Departman Müdürü',
    createdAt: DateTime(2025, 1, 1),
    isActive: true,
  );

  /// Employee kullanıcısı
  static final User employeeUser = User(
    id: '3',
    email: 'employee@ofis.com',
    firstName: 'Employee',
    lastName: 'User',
    roles: ['employee'],
    department: 'Yazılım Geliştirme',
    jobTitle: 'Yazılım Geliştirici',
    createdAt: DateTime(2025, 1, 1),
    isActive: true,
  );

  /// Tüm seed kullanıcılar
  static final List<User> allUsers = [
    adminUser,
    managerUser,
    employeeUser,
  ];

  /// Email ve şifreye göre kullanıcı bul
  /// Şifreler: Admin123! , ofis123 , employee123
  static User? findUserByEmailAndPassword(String email, String password) {
    // Admin
    if (email == 'admin@ofis.com' && password == 'Admin123!') {
      return adminUser;
    }

    // Manager
    if (email == 'manager@ofis.com' && password == 'ofis123') {
      return managerUser;
    }

    // Employee
    if (email == 'employee@ofis.com' && password == 'employee123') {
      return employeeUser;
    }

    return null;
  }

  /// Email'e göre kullanıcı bul
  static User? findUserByEmail(String email) {
    try {
      return allUsers.firstWhere((user) => user.email == email);
    } catch (e) {
      return null;
    }
  }

  /// Tüm seed veriler için gösterim
  static String debugInfo() {
    return '''
╔════════════════════════════════════════════════════════════════╗
║              SEED KULLANICILAR - TEST İÇİN                    ║
╠════════════════════════════════════════════════════════════════╣
║ 1. ADMIN                                                       ║
║    Email: admin@ofis.com                                       ║
║    Password: Admin123!                                         ║
║    Role: Admin                                                 ║
║                                                                ║
║ 2. MANAGER                                                     ║
║    Email: manager@ofis.com                                     ║
║    Password: ofis123                                           ║
║    Role: Manager                                               ║
║                                                                ║
║ 3. EMPLOYEE                                                    ║
║    Email: employee@ofis.com                                    ║
║    Password: employee123                                       ║
║    Role: Employee                                              ║
╚════════════════════════════════════════════════════════════════╝
''';
  }
}
