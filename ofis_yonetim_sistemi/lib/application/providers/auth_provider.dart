import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/entities/user.dart';

// Storage provider
const _storage = FlutterSecureStorage();

// Auth state enum
enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error,
}

// Auth state class
class AuthState {
  final AuthStatus status;
  final User? user;
  final String? errorMessage;

  const AuthState({
    required this.status,
    this.user,
    this.errorMessage,
  });

  AuthState copyWith({
    AuthStatus? status,
    User? user,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// Auth provider
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState(status: AuthStatus.initial)) {
    _checkAuthStatus();
  }

  // Check if user is already logged in
  Future<void> _checkAuthStatus() async {
    state = state.copyWith(status: AuthStatus.loading);
    
    try {
      final token = await _storage.read(key: 'auth_token');
      final userJson = await _storage.read(key: 'user_data');
      
      if (token != null && userJson != null) {
        // Simulate user data parsing
        final user = User(
          id: '1',
          email: 'user@example.com',
          firstName: 'Test',
          lastName: 'User',
          roles: ['employee'],
          isActive: true,
          createdAt: DateTime.now(),
        );
        
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: user,
        );
      } else {
        state = state.copyWith(status: AuthStatus.unauthenticated);
      }
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Kimlik doğrulama kontrolü başarısız: $e',
      );
    }
  }

  // Login method (mock implementation)
  Future<void> login(String email, String password) async {
    state = state.copyWith(status: AuthStatus.loading);
    
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock login validation
      if (email.isNotEmpty && password.isNotEmpty) {
        // Create mock user
        final user = User(
          id: '1',
          email: email,
          firstName: 'Test',
          lastName: 'User',
          roles: email.contains('admin') ? ['admin'] : ['employee'],
          isActive: true,
          createdAt: DateTime.now(),
        );
        
        // Save to secure storage
        await _storage.write(key: 'auth_token', value: 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}');
        await _storage.write(key: 'user_data', value: user.toJson().toString());
        
        state = state.copyWith(
          status: AuthStatus.authenticated,
          user: user,
        );
      } else {
        state = state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'Email ve şifre gereklidir',
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Giriş başarısız: $e',
      );
    }
  }

  // Logout method
  Future<void> logout() async {
    state = state.copyWith(status: AuthStatus.loading);
    
    try {
      // Clear secure storage
      await _storage.delete(key: 'auth_token');
      await _storage.delete(key: 'user_data');
      
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        user: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Çıkış başarısız: $e',
      );
    }
  }

  // Clear error
  void clearError() {
    state = state.copyWith(
      status: AuthStatus.unauthenticated,
      errorMessage: null,
    );
  }
}

// Auth provider instance
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

// Convenience providers
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authProvider).status == AuthStatus.authenticated;
});

final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authProvider).user;
});

final authStatusProvider = Provider<AuthStatus>((ref) {
  return ref.watch(authProvider).status;
});