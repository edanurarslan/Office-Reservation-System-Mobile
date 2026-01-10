import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infrastructure/network/api_service.dart';
import '../../domain/models/location_model.dart';

// ============================================================================
// LOCATION STATE
// ============================================================================

class LocationsState {
  final List<LocationDto> locations;
  final bool isLoading;
  final String? error;

  const LocationsState({
    this.locations = const [],
    this.isLoading = false,
    this.error,
  });

  LocationsState copyWith({
    List<LocationDto>? locations,
    bool? isLoading,
    String? error,
  }) {
    return LocationsState(
      locations: locations ?? this.locations,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

// ============================================================================
// LOCATION NOTIFIER
// ============================================================================

class LocationsNotifier extends StateNotifier<LocationsState> {
  final ApiService _apiService;

  LocationsNotifier(this._apiService) : super(const LocationsState());

  /// Load all locations
  Future<void> loadLocations() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      print('🔄 LocationsProvider: Fetching locations from API...');
      final locations = await _apiService.getLocations();
      print('✅ LocationsProvider: Got ${locations.length} locations');
      
      state = state.copyWith(
        locations: locations,
        isLoading: false,
      );
    } catch (e, stack) {
      print('❌ LocationsProvider Error: $e');
      print('Stack: $stack');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Create new location
  Future<bool> createLocation({
    required String name,
    required String address,
    String? description,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      await _apiService.createLocation(
        name: name,
        address: address,
        description: description,
      );
      
      // Refresh list
      await loadLocations();
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  /// Update location
  Future<bool> updateLocation({
    required String id,
    String? name,
    String? address,
    String? description,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      await _apiService.updateLocation(
        id: id,
        name: name,
        address: address,
        description: description,
      );
      
      // Refresh list
      await loadLocations();
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  /// Delete location
  Future<bool> deleteLocation(String id) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      await _apiService.deleteLocation(id);
      await loadLocations();
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }
}

// ============================================================================
// PROVIDERS
// ============================================================================

final locationsProvider = StateNotifierProvider<LocationsNotifier, LocationsState>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return LocationsNotifier(apiService);
});
