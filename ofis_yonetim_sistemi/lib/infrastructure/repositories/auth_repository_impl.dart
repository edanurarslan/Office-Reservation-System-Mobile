import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FlutterSecureStorage secureStorage;
  
  AuthRepositoryImpl({required this.secureStorage});

  @override
  Future<User?> login(String email, String password) async {
    // Mock giriş kontrolü
    if (email == 'admin@ofis.com' && password == '123456') {
      final user = User(
        id: '1',
        firstName: 'Admin',
        lastName: 'User',
        email: email,
        roles: ['admin'],
        createdAt: DateTime.now(),
      );
      
      // Token ve kullanıcı bilgilerini kaydet
      await saveToken('mock_jwt_token_${user.id}');
      await saveUser(user);
      
      return user;
    } else if (email == 'user@ofis.com' && password == '123456') {
      final user = User(
        id: '2',
        firstName: 'Normal',
        lastName: 'User',
        email: email,
        roles: ['user'],
        createdAt: DateTime.now(),
      );
      
      await saveToken('mock_jwt_token_${user.id}');
      await saveUser(user);
      
      return user;
    }
    
    return null;
  }

  @override
  Future<void> logout() async {
    await removeToken();
    await secureStorage.delete(key: 'user_data');
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      final userData = await secureStorage.read(key: 'user_data');
      if (userData != null) {
        return User.fromJson(userData as Map<String, dynamic>);
      }
    } catch (e) {
      // Hata durumunda null dön
    }
    return null;
  }

  @override
  Future<void> saveUser(User user) async {
    await secureStorage.write(key: 'user_data', value: user.toJson().toString());
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