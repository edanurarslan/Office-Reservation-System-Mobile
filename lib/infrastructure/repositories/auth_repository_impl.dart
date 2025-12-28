import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../network/api_service.dart';
import '../seed/seed_users.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FlutterSecureStorage secureStorage;
  final ApiService apiService;
  
  // GEÇICI: Seed veriler ile çalışma modu
  // TODO: API'ye bağlantı kurulduktan sonra useRealApi = true yapın
  static const bool useRealApi = true;
  
  AuthRepositoryImpl({
    required this.secureStorage,
    required this.apiService,
  });

  @override
  Future<User?> login(String email, String password) async {
    try {
      User? user;

      if (useRealApi) {
        // ==========================================
        // GERÇEK API KULLANILACAK ZAMAN AKTIF YAPILACAK
        // ==========================================
        // Call real API
        final loginResponse = await apiService.login(
          email: email,
          password: password,
        );
        
        // Save tokens
        await saveToken(loginResponse.accessToken);
        await secureStorage.write(
          key: 'refresh_token',
          value: loginResponse.refreshToken,
        );
        
        // Set authorization header for subsequent requests
        apiService.setAuthToken(loginResponse.accessToken);
        
        // Convert API response to Domain Entity
        final userData = loginResponse.user;
        user = User(
          id: userData.id,
          firstName: userData.firstName,
          lastName: userData.lastName,
          email: userData.email,
          roles: [userData.role.value],
          createdAt: DateTime.now(),
          displayName: '${userData.firstName} ${userData.lastName}',
          organizationId: userData.managerId ?? '',
          department: userData.department ?? '',
          jobTitle: userData.jobTitle ?? '',
        );
        
        print('✅ Real API Login successful for $email');
      } else {
        // ==========================================
        // GEÇICI: SEED VERİLERİ KULLANILIYOR
        // ==========================================
        // Use seed users for testing
        user = SeedUsers.findUserByEmailAndPassword(email, password);
        
        if (user != null) {
          // Simulate token generation (would come from API in production)
          const mockToken = 'mock_token_from_seed_data_12345678901234567890';
          const mockRefreshToken = 'mock_refresh_token_from_seed_data_98765432109876543210';
          
          // Save tokens
          await saveToken(mockToken);
          await secureStorage.write(
            key: 'refresh_token',
            value: mockRefreshToken,
          );
          
          // Set authorization header for subsequent requests
          apiService.setAuthToken(mockToken);
          
          print('✅ Seed data Login successful for $email (API pending)');
        } else {
          print('❌ Invalid credentials for seed user: $email');
          return null;
        }
      }
      
      // Save user data
      await saveUser(user);
      
      return user;
    } catch (e) {
      print('❌ Login error: $e');
      return null;
    }
  }

  @override
  Future<void> logout() async {
    // Token'ı oku
    final token = await getStoredToken();
    if (useRealApi && token != null && token.isNotEmpty) {
      try {
        await apiService.logout(token);
      } catch (e) {
        print('Logout API error: $e');
      }
    }
    await removeToken();
    await secureStorage.delete(key: 'user_data');
    apiService.clearAuthToken();
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