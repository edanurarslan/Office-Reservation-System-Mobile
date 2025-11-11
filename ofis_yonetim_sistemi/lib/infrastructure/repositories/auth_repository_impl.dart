import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_api_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FlutterSecureStorage secureStorage;
  final AuthApiDataSource apiDataSource;
  
  AuthRepositoryImpl({
    required this.secureStorage,
    required this.apiDataSource,
  });

  @override
  Future<User?> login(String email, String password) async {
    try {
      // 🔧 GEÇICI: Development için mock login
      // Backend bağlantı problemleri olduğunda otomatik giriş
      // TODO: Production'da kaldır!
      
      // Basit validasyon
      if (email.isEmpty || password.isEmpty) {
        return null;
      }
      
      // Email'e göre rol belirle
      List<String> roles;
      String firstName;
      String lastName;
      
      if (email.toLowerCase().contains('admin')) {
        roles = ['Admin'];
        firstName = 'Admin';
        lastName = 'User';
      } else if (email.toLowerCase().contains('manager')) {
        roles = ['Manager'];
        firstName = 'Manager';
        lastName = 'User';
      } else {
        roles = ['Employee'];
        firstName = 'Employee';
        lastName = 'User';
      }
      
      // Mock user oluştur
      final mockUser = User(
        id: 'dev-user-${DateTime.now().millisecondsSinceEpoch}',
        firstName: firstName,
        lastName: lastName,
        email: email,
        roles: roles,
        createdAt: DateTime.now(),
        displayName: '$firstName $lastName',
        organizationId: 'dev-org',
        department: roles.first == 'Admin' ? 'IT' : (roles.first == 'Manager' ? 'Management' : 'Operations'),
        jobTitle: roles.first,
      );
      
      // Mock token kaydet
      await saveToken('mock_access_token_${DateTime.now().millisecondsSinceEpoch}');
      await secureStorage.write(
        key: 'refresh_token',
        value: 'mock_refresh_token',
      );
      
      // User data kaydet
      await saveUser(mockUser);
      
      print('🔧 DEV MODE: Mock login successful for $email with role ${roles.first}');
      return mockUser;
      
      /* GERÇEK API KODU - Backend hazır olunca açılacak
      // Call real API
      final loginResponse = await apiDataSource.login(email, password);
      
      // Save tokens
      await saveToken(loginResponse.accessToken);
      await secureStorage.write(
        key: 'refresh_token',
        value: loginResponse.refreshToken,
      );
      
      // Convert API DTO to Domain Entity
      final user = User(
        id: loginResponse.user.id,
        firstName: loginResponse.user.firstName,
        lastName: loginResponse.user.lastName,
        email: loginResponse.user.email,
        roles: [loginResponse.user.role],
        createdAt: DateTime.now(),
        displayName: '${loginResponse.user.firstName} ${loginResponse.user.lastName}',
        organizationId: loginResponse.user.department,
        department: loginResponse.user.department,
        jobTitle: loginResponse.user.jobTitle,
      );
      
      // Save user data
      await saveUser(user);
      
      return user;
      */
    } catch (e) {
      // Log error and return null on failure
      print('Login error: $e');
      return null;
    }
  }

  @override
  Future<void> logout() async {
    await removeToken();
    await secureStorage.delete(key: 'user_data');
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      final userDataStr = await secureStorage.read(key: 'user_data');
      if (userDataStr != null && userDataStr.isNotEmpty) {
        final userDataJson = Map<String, dynamic>.from(
          Uri.splitQueryString(userDataStr),
        );
        return User.fromJson(userDataJson);
      }
    } catch (e) {
      print('Get current user error: $e');
    }
    return null;
  }

  @override
  Future<void> saveUser(User user) async {
    try {
      final userJson = user.toJson();
      await secureStorage.write(
        key: 'user_data',
        value: userJson.toString(),
      );
    } catch (e) {
      print('Save user error: $e');
    }
  }

  @override
  Future<String?> getStoredToken() async {
    return await secureStorage.read(key: 'auth_token');
  }

  @override
  Future<void> saveToken(String token) async {
    await secureStorage.write(key: 'auth_token', value: token);
  }

  @override
  Future<void> removeToken() async {
    await secureStorage.delete(key: 'auth_token');
  }
}