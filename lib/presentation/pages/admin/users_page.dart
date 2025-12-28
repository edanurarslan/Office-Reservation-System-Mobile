import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/common/common.dart';

class UsersPage extends ConsumerStatefulWidget {
  const UsersPage({super.key});

  @override
  ConsumerState<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends ConsumerState<UsersPage> {
  // Mock Data & States - İçerik birebir aynı
  String _searchTerm = '';
  String _roleFilter = 'Tüm Roller';
  String _statusFilter = 'Tüm Durumlar';

  final List<Map<String, dynamic>> _allUsers = [
    {
      'id': '1',
      'firstName': 'Ahmet',
      'lastName': 'Yılmaz',
      'email': 'ahmet@ofis.com',
      'role': 'admin',
      'status': 'active',
      'department': 'Yazılım'
    },
    {
      'id': '2',
      'firstName': 'Ayşe',
      'lastName': 'Demir',
      'email': 'ayse@ofis.com',
      'role': 'manager',
      'status': 'active',
      'department': 'İK'
    },
    {
      'id': '3',
      'firstName': 'Mehmet',
      'lastName': 'Kaya',
      'email': 'mehmet@ofis.com',
      'role': 'user',
      'status': 'inactive',
      'department': 'Pazarlama'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 700;

    return AppLayout(
      title: 'Kullanıcı Yönetimi',
      currentRoute: '/users',
      child: PermissionGuardWidget(
        requiredRoute: '/users',
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isMobile ? 16 : 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPageHeader(isMobile),
              const SizedBox(height: 32),
              _buildStatsGrid(isMobile),
              const SizedBox(height: 32),
              _buildMainCard(isMobile),
            ],
          ),
        ),
      ),
    );
  }

  // --- Header: Başlık ve Yeni Kullanıcı Butonu ---
  Widget _buildPageHeader(bool isMobile) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 20,
      runSpacing: 20,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kullanıcı Yönetimi',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Ekip üyelerini yetkilendirin ve erişim izinlerini kontrol edin.',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                color: const Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Yeni Kullanıcı'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4F46E5),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 8,
            shadowColor: const Color(0xFF4F46E5).withOpacity(0.4),
          ),
        ),
      ],
    );
  }

  // --- İstatistik Kartları ---
  Widget _buildStatsGrid(bool isMobile) {
    return LayoutBuilder(builder: (context, constraints) {
      return GridView.count(
        crossAxisCount: isMobile ? 1 : 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: isMobile ? 3 : 2.5,
        children: [
          _buildStatCard('Toplam Kullanıcı', '156', Icons.group, const Color(0xFF4F46E5), const Color(0xFFEEF2FF)),
          _buildStatCard('Aktif Kullanıcı', '142', Icons.person_add, const Color(0xFF059669), const Color(0xFFBBF7D0)),
          _buildStatCard('Admin Sayısı', '12', Icons.shield_outlined, const Color(0xFFB45309), const Color(0xFFFDE68A)),
        ],
      );
    });
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color, Color bg) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(16)),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label, style: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.bold, color: const Color(0xFF64748B))),
              Text(value, style: GoogleFonts.plusJakartaSans(fontSize: 24, fontWeight: FontWeight.w800, color: const Color(0xFF1E293B))),
            ],
          )
        ],
      ),
    );
  }

  // --- Ana Kart: Filtreler ve Tablo ---
  Widget _buildMainCard(bool isMobile) {
    return Container(
      decoration: _cardDecoration(),
      child: Column(
        children: [
          _buildFilterBar(isMobile),
          const Divider(height: 1),
          _buildUserTable(isMobile),
        ],
      ),
    );
  }

  Widget _buildFilterBar(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        alignment: WrapAlignment.spaceBetween,
        children: [
          SizedBox(
            width: isMobile ? double.infinity : 300,
            child: TextField(
              onChanged: (val) => setState(() => _searchTerm = val),
              decoration: InputDecoration(
                hintText: 'İsim, e-posta ile ara...',
                prefixIcon: const Icon(Icons.search, size: 20),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
              ),
            ),
          ),
          Wrap(
            spacing: 12,
            children: [
              _buildDropdown(['Tüm Roller', 'Admin', 'Yönetici', 'Kullanıcı'], _roleFilter, (val) => setState(() => _roleFilter = val!)),
              _buildDropdown(['Tüm Durumlar', 'Aktif', 'Pasif'], _statusFilter, (val) => setState(() => _statusFilter = val!)),
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.refresh, size: 20),
                style: IconButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildUserTable(bool isMobile) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _allUsers.length,
      separatorBuilder: (context, index) => const Divider(height: 1, indent: 20, endIndent: 20),
      itemBuilder: (context, index) {
        final user = _allUsers[index];
        return _buildUserRow(user, isMobile);
      },
    );
  }

  Widget _buildUserRow(Map<String, dynamic> user, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                _buildAvatar(user['firstName'], user['lastName']),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${user['firstName']} ${user['lastName']}', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, color: const Color(0xFF1E293B))),
                      Text(user['email'], style: GoogleFonts.plusJakartaSans(fontSize: 12, color: const Color(0xFF64748B))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (!isMobile)
            Expanded(
              flex: 2,
              child: _buildBadge(user['role'].toString().toUpperCase(), _getRoleColor(user['role'])),
            ),
          if (!isMobile)
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Container(width: 8, height: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: user['status'] == 'active' ? Colors.green : Colors.red)),
                  const SizedBox(width: 8),
                  Text(user['status'] == 'active' ? 'Aktif' : 'Pasif', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined, size: 20, color: Color(0xFF64748B))),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outline, size: 20, color: Colors.red)),
            ],
          )
        ],
      ),
    );
  }

  // --- Yardımcı Metodlar ---
  Widget _buildAvatar(String f, String l) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [Color(0xFF6366F1), Color(0xFF2563EB)], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      alignment: Alignment.center,
      child: Text('${f[0]}${l[0]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return UnconstrainedBox(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(6), border: Border.all(color: color.withOpacity(0.2))),
        child: Text(text, style: GoogleFonts.plusJakartaSans(fontSize: 10, fontWeight: FontWeight.w800, color: color, letterSpacing: 0.5)),
      ),
    );
  }

  Color _getRoleColor(String role) {
    if (role == 'admin') return Colors.purple;
    if (role == 'manager') return Colors.blue;
    return Colors.teal;
  }

  Widget _buildDropdown(List<String> items, String value, Function(String?) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(fontSize: 13)))).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFFE2E8F0)),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
    );
  }
}