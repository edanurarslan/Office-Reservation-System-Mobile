import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../application/providers/locations_provider.dart';
import '../../../domain/models/location_model.dart';

class LocationsPage extends ConsumerStatefulWidget {
  const LocationsPage({super.key});

  @override
  ConsumerState<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends ConsumerState<LocationsPage> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(locationsProvider.notifier).loadLocations();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<LocationDto> get _filteredLocations {
    final state = ref.watch(locationsProvider);
    if (_searchQuery.isEmpty) return state.locations;
    final query = _searchQuery.toLowerCase();
    return state.locations.where((loc) {
      return loc.name.toLowerCase().contains(query) ||
          loc.address.toLowerCase().contains(query) ||
          (loc.description?.toLowerCase().contains(query) ?? false);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(locationsProvider);
    final locations = _filteredLocations;
    final locationCount = state.locations.length;

    return Stack(
      children: [
        Container(
          color: const Color(0xFFF8FAFC),
          child: Column(
            children: [
              _buildHeader(theme, locationCount),
              Expanded(
                child: state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state.error != null
                        ? _buildError(state.error!)
                        : _buildContent(theme, locations),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 24,
          right: 24,
          child: FloatingActionButton.extended(
            onPressed: () => _showAddDialog(context),
            backgroundColor: theme.primaryColor,
            icon: const Icon(Icons.add, color: Colors.white),
            label: Text('Yeni Lokasyon', style: GoogleFonts.poppins(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(ThemeData theme, int locationCount) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.location_on, color: theme.primaryColor, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lokasyonlar', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF1E293B))),
                    Text('$locationCount lokasyon bulundu', style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF64748B))),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => ref.read(locationsProvider.notifier).loadLocations(),
                icon: Icon(Icons.refresh, color: theme.primaryColor),
                tooltip: 'Yenile',
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _searchController,
            onChanged: (value) => setState(() => _searchQuery = value),
            decoration: InputDecoration(
              hintText: 'Lokasyon ara...',
              hintStyle: GoogleFonts.poppins(color: const Color(0xFF94A3B8)),
              prefixIcon: const Icon(Icons.search, color: Color(0xFF64748B)),
              filled: true,
              fillColor: const Color(0xFFF1F5F9),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
          const SizedBox(height: 16),
          Text('Hata olustu', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: const Color(0xFF1E293B))),
          const SizedBox(height: 8),
          Text(error, style: GoogleFonts.poppins(fontSize: 14, color: const Color(0xFF64748B)), textAlign: TextAlign.center),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => ref.read(locationsProvider.notifier).loadLocations(),
            icon: const Icon(Icons.refresh),
            label: const Text('Tekrar Dene'),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(ThemeData theme, List<LocationDto> locations) {
    if (locations.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_off, size: 64, color: Colors.grey.shade300),
            const SizedBox(height: 16),
            Text(_searchQuery.isEmpty ? 'Henuz lokasyon yok' : 'Sonuc bulunamadi', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: const Color(0xFF1E293B))),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: locations.length,
      itemBuilder: (context, index) => _buildLocationCard(theme, locations[index]),
    );
  }

  Widget _buildLocationCard(ThemeData theme, LocationDto location) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(color: theme.primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
          child: Icon(Icons.location_on, color: theme.primaryColor),
        ),
        title: Text(location.name, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: const Color(0xFF1E293B))),
        subtitle: Text(location.address, style: GoogleFonts.poppins(fontSize: 13, color: const Color(0xFF64748B))),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () => _showEditDialog(context, location), icon: const Icon(Icons.edit_outlined), color: const Color(0xFF64748B)),
            IconButton(onPressed: () => _showDeleteConfirm(context, location), icon: const Icon(Icons.delete_outline), color: Colors.red.shade400),
          ],
        ),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    _nameController.clear();
    _addressController.clear();
    _descriptionController.clear();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Yeni Lokasyon Ekle', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Lokasyon Adi', prefixIcon: Icon(Icons.location_on))),
            const SizedBox(height: 12),
            TextField(controller: _addressController, decoration: const InputDecoration(labelText: 'Adres', prefixIcon: Icon(Icons.place))),
            const SizedBox(height: 12),
            TextField(controller: _descriptionController, decoration: const InputDecoration(labelText: 'Aciklama', prefixIcon: Icon(Icons.description))),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Iptal')),
          ElevatedButton(
            onPressed: () async {
              if (_nameController.text.isEmpty) return;
              Navigator.pop(ctx);
              await ref.read(locationsProvider.notifier).createLocation(
                    name: _nameController.text,
                    address: _addressController.text.isEmpty ? 'Belirtilmedi' : _addressController.text,
                    description: _descriptionController.text.isEmpty ? null : _descriptionController.text,
                  );
            },
            child: const Text('Ekle'),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context, LocationDto location) {
    _nameController.text = location.name;
    _addressController.text = location.address;
    _descriptionController.text = location.description ?? '';
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Lokasyonu Duzenle', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Lokasyon Adi', prefixIcon: Icon(Icons.location_on))),
            const SizedBox(height: 12),
            TextField(controller: _addressController, decoration: const InputDecoration(labelText: 'Adres', prefixIcon: Icon(Icons.place))),
            const SizedBox(height: 12),
            TextField(controller: _descriptionController, decoration: const InputDecoration(labelText: 'Aciklama', prefixIcon: Icon(Icons.description))),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Iptal')),
          ElevatedButton(
            onPressed: () async {
              if (_nameController.text.isEmpty) return;
              Navigator.pop(ctx);
              await ref.read(locationsProvider.notifier).updateLocation(
                    id: location.id,
                    name: _nameController.text,
                    address: _addressController.text.isEmpty ? null : _addressController.text,
                    description: _descriptionController.text.isEmpty ? null : _descriptionController.text,
                  );
            },
            child: const Text('Kaydet'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirm(BuildContext context, LocationDto location) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Lokasyonu Sil'),
        content: Text('"${location.name}" lokasyonunu silmek istediginize emin misiniz?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Iptal')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              Navigator.pop(ctx);
              await ref.read(locationsProvider.notifier).deleteLocation(location.id);
            },
            child: const Text('Sil', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}