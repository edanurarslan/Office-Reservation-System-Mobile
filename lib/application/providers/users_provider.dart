import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infrastructure/network/api_service.dart';
import '../../domain/models/user_model.dart';

// ============================================================================
// USER STATE
// ============================================================================

class UsersState {
  final List<UserDto> users;
  final bool isLoading;
  final String? error;
  final int totalCount;
  final int page;
  final int pageSize;
  final int totalPages;
  
  // Stats
  final int activeUsers;
  final int adminCount;

  const UsersState({
    this.users = const [],
    this.isLoading = false,
    this.error,
    this.totalCount = 0,
    this.page = 1,
    this.pageSize = 10,
    this.totalPages = 0,
    this.activeUsers = 0,
    this.adminCount = 0,
  });

  UsersState copyWith({
    List<UserDto>? users,
    bool? isLoading,
    String? error,
    int? totalCount,
    int? page,
    int? pageSize,
    int? totalPages,
    int? activeUsers,
    int? adminCount,
  }) {
    return UsersState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      totalCount: totalCount ?? this.totalCount,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      totalPages: totalPages ?? this.totalPages,
      activeUsers: activeUsers ?? this.activeUsers,
      adminCount: adminCount ?? this.adminCount,
    );
  }
}

// ============================================================================
// USER NOTIFIER
// ============================================================================

class UsersNotifier extends StateNotifier<UsersState> {
  final ApiService _apiService;

  UsersNotifier(this._apiService) : super(const UsersState());

  /// Load users - alias for fetchUsers with no params
  Future<void> loadUsers() => fetchUsers();

  /// Fetch users with optional filters
  Future<void> fetchUsers({
    String? search,
    String? role,
    String? status,
    int page = 1,
    int pageSize = 10,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      print('🔄 UsersProvider: Fetching users from API...');
      final response = await _apiService.getUsersWithFilters(
        search: search,
        role: role,
        status: status,
        page: page,
        pageSize: pageSize,
      );
      
      print('✅ UsersProvider: Got ${response.users.length} users');
      final users = response.users;
      final activeCount = users.where((u) => u.status == 'active').length;
      final adminCount = users.where((u) => u.role.value.toLowerCase() == 'admin').length;
      
      state = state.copyWith(
        users: users,
        isLoading: false,
        totalCount: response.totalCount,
        page: response.page,
        pageSize: response.pageSize,
        totalPages: response.totalPages,
        activeUsers: activeCount,
        adminCount: adminCount,
      );
      print('✅ UsersProvider: State updated with ${users.length} users');
    } catch (e, stack) {
      print('❌ UsersProvider Error: $e');
      print('Stack: $stack');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Create new user
  Future<bool> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String role,
    String? password,
    String? department,
    String? phoneNumber,
    String? jobTitle,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      await _apiService.createUser(
        firstName: firstName,
        lastName: lastName,
        email: email,
        role: role,
        password: password,
        department: department,
        phoneNumber: phoneNumber,
        jobTitle: jobTitle,
      );
      
      // Refresh list
      await fetchUsers();
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  /// Update user
  Future<bool> updateUser({
    required String id,
    String? firstName,
    String? lastName,
    String? email,
    String? role,
    String? department,
    String? phoneNumber,
    String? jobTitle,
    String? password,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      await _apiService.updateUserFull(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        role: role,
        department: department,
        phoneNumber: phoneNumber,
        jobTitle: jobTitle,
        password: password,
      );
      
      // Refresh list
      await fetchUsers();
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  /// Delete user
  Future<bool> deleteUser(String id) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      await _apiService.deleteUser(id);
      await fetchUsers();
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  /// Get user roles
  Future<List<String>> fetchRoles() async {
    try {
      return await _apiService.getUserRoles();
    } catch (e) {
      return ['admin', 'manager', 'employee', 'user'];
    }
  }
}

// ============================================================================
// PROVIDERS
// ============================================================================

final usersProvider = StateNotifierProvider<UsersNotifier, UsersState>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return UsersNotifier(apiService);
});

/// Provider for available roles
final userRolesProvider = FutureProvider<List<String>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  try {
    return await apiService.getUserRoles();
  } catch (e) {
    return ['admin', 'manager', 'employee', 'user'];
  }
});
