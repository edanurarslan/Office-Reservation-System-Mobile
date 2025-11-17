import '../../domain/entities/resource.dart';

/// Seed resources for offline development
class SeedResources {
  static const List<Resource> resources = [
    // Meeting Rooms
    Resource(
      id: 'meeting-room-1',
      name: 'Toplantı Odası A',
      type: ResourceType.room,
      capacity: 8,
      description: 'Projeksiyon ve beyaz tahta bulunan toplantı odası',
      locationId: 'location-1',
      locationName: '1. Kat, Kuzey Koridor',
      amenities: ['Projeksiyon', 'Beyaz Tahta', 'Kahve Makinesi'],
      isActive: true,
    ),
    Resource(
      id: 'meeting-room-2',
      name: 'Toplantı Odası B',
      type: ResourceType.room,
      capacity: 6,
      description: 'Video konferans özellikli toplantı odası',
      locationId: 'location-1',
      locationName: '1. Kat, Kuzey Koridor',
      amenities: ['Video Konf.', 'Ses Sistemi', 'Monitör'],
      isActive: true,
    ),
    // Desks
    Resource(
      id: 'desk-1',
      name: 'Masa 1',
      type: ResourceType.desk,
      capacity: 1,
      description: 'Pencere kenarında sessiz çalışma masası',
      locationId: 'location-2',
      locationName: '2. Kat, Güney Bölüm',
      amenities: ['Doğal Işık', 'Ethernet', 'Monitör'],
      isActive: true,
    ),
    Resource(
      id: 'desk-2',
      name: 'Masa 2',
      type: ResourceType.desk,
      capacity: 1,
      description: 'Orta bölüm çalışma masası',
      locationId: 'location-2',
      locationName: '2. Kat, Güney Bölüm',
      amenities: ['Elektrik', 'USB Port', 'Ev Geçidi'],
      isActive: true,
    ),
    Resource(
      id: 'desk-3',
      name: 'Masa 3',
      type: ResourceType.desk,
      capacity: 1,
      description: 'Kuzey bölüm çalışma masası',
      locationId: 'location-3',
      locationName: '3. Kat, Merkez',
      amenities: ['Elektrik', 'Monitör', 'USB-C'],
      isActive: true,
    ),
    // Parking
    Resource(
      id: 'parking-1',
      name: 'Otopark Alanı 1',
      type: ResourceType.parkingSpace,
      capacity: 1,
      description: 'Kapalı otopark',
      locationId: 'location-3',
      locationName: 'Bodrum Kat',
      amenities: ['Kapalı', 'Güvenlik Kamerası'],
      isActive: true,
    ),
  ];

  /// Get all seed resources
  static List<Resource> getAll() => resources;

  /// Get resources by type
  static List<Resource> getByType(ResourceType type) {
    return resources.where((r) => r.type == type).toList();
  }

  /// Get resource by ID
  static Resource? getById(String id) {
    try {
      return resources.firstWhere((r) => r.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Get active resources only
  static List<Resource> getActive() {
    return resources.where((r) => r.isActive).toList();
  }
}
