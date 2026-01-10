import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../application/providers/users_provider.dart';
import '../../../domain/models/user_model.dart';
import '../../widgets/common/common.dart';

class ManagerUsersPage extends ConsumerStatefulWidget {
  const ManagerUsersPage({super.key});

  @override
  ConsumerState<ManagerUsersPage> createState() => _ManagerUsersPageState();
}

class _ManagerUsersPageState extends ConsumerState<ManagerUsersPage> {
  // Mock Data & States
  bool _loading = false;
  String _searchTerm = '';
  String _roleFilter = '';
  String _statusFilter = '';
  
  // Controllers for Modal Form
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _departmentController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _selectedRole = 'Employee';

  @override
  void initState() {
    super.initState();
    // İlk yüklemede kullanıcıları çek
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(usersProvider.notifier).loadUsers();
    });
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _departmentController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // --- Handlers matching React logic ---

  void _resetForm() {
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _departmentController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    _selectedRole = 'Employee';
  }

  Future<void> _handleCreateUser() async {
    // Form logic: firstName, lastName and email are mandatory
    if (_firstNameController.text.isEmpty || _lastNameController.text.isEmpty || _emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ad, soyad ve e-posta zorunludur')));
      return;
    }
    
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Şifreler eşleşmiyor'), backgroundColor: Colors.red));
      return;
    }
    
    final success = await ref.read(usersProvider.notifier).createUser(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      role: _selectedRole.toLowerCase(),
      phoneNumber: _phoneController.text.isNotEmpty ? _phoneController.text : null,
      department: _departmentController.text.isNotEmpty ? _departmentController.text : null,
      password: _passwordController.text.isNotEmpty ? _passwordController.text : null,
    );
    
    if (mounted) {
      Navigator.pop(context);
      _resetForm();
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Kullanıcı başarıyla oluşturuldu'), backgroundColor: Colors.green));
      } else {
        final error = ref.read(usersProvider).error;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error ?? 'Hata oluştu'), backgroundColor: Colors.red));
      }
    }
  }

  Future<void> _handleUpdateUser(String userId) async {
    if (_firstNameController.text.isEmpty || _lastNameController.text.isEmpty || _emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ad, soyad ve e-posta zorunludur')));
      return;
    }
    
    // Add password only if provided
    String? password;
    if (_passwordController.text.isNotEmpty) {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Şifreler eşleşmiyor'), backgroundColor: Colors.red));
        return;
      }
      password = _passwordController.text;
    }
    
    final success = await ref.read(usersProvider.notifier).updateUser(
      id: userId,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      role: _selectedRole.toLowerCase(),
      phoneNumber: _phoneController.text.isNotEmpty ? _phoneController.text : null,
      department: _departmentController.text.isNotEmpty ? _departmentController.text : null,
      password: password,
    );
    
    if (mounted) {
      Navigator.pop(context);
      _resetForm();
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Kullanıcı başarıyla güncellendi'), backgroundColor: Colors.green));
      } else {
        final error = ref.read(usersProvider).error;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error ?? 'Hata oluştu'), backgroundColor: Colors.red));
      }
    }
  }

  Future<void> _handleDeleteUser(String userId) async {
    final success = await ref.read(usersProvider.notifier).deleteUser(userId);
    
    if (mounted) {
      Navigator.pop(context);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Kullanıcı başarıyla silindi'), backgroundColor: Colors.green));
      } else {
        final error = ref.read(usersProvider).error;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error ?? 'Hata oluştu'), backgroundColor: Colors.red));
      }
    }
  }

  String _getRoleString(UserRole role) {
    switch (role) {
      case UserRole.admin: return 'Admin';
      case UserRole.manager: return 'Manager';
      default: return 'Employee';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 700;
    
    // Watch users state from provider
    final usersState = ref.watch(usersProvider);
    final users = usersState.users;
    final isLoading = usersState.isLoading;
    
    // Stats from state
    final totalUsers = usersState.totalCount;
    final activeUsers = usersState.activeUsers;
    final admins = usersState.adminCount;
    final error = usersState.error;

    return PermissionGuardWidget(
      requiredRoute: '/users',
      child: isLoading
        ? const Center(child: CircularProgressIndicator())
        : error != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Hata: $error', style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => ref.read(usersProvider.notifier).loadUsers(),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Tekrar Dene'),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.all(isMobile ? 16 : 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPageHeader(isMobile),
                  const SizedBox(height: 32),
                  _buildStatsGrid(isMobile, totalUsers, activeUsers, admins),
                  const SizedBox(height: 32),
                  _buildMainCard(isMobile, users),
                ],
              ),
            ),
    );
  }

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
            Text('Kullanıcı Yönetimi', style: GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.w800, color: const Color(0xFF1E293B))),
            const SizedBox(height: 4),
            Text('Ekip üyelerini yetkilendirin ve erişim izinlerini kontrol edin.', style: GoogleFonts.plusJakartaSans(fontSize: 14, color: const Color(0xFF64748B))),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {
            _resetForm();
            _showUserFormModal(context, isEdit: false);
          },
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

  Widget _buildStatsGrid(bool isMobile, int totalUsers, int activeUsers, int admins) {
    return GridView.count(
      crossAxisCount: isMobile ? 1 : 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: isMobile ? 3 : 2.5,
      children: [
        _buildStatCard('Toplam Kullanıcı', totalUsers.toString(), Icons.group, const Color(0xFF4F46E5), const Color(0xFFEEF2FF)),
        _buildStatCard('Aktif Kullanıcı', activeUsers.toString(), Icons.person_add, const Color(0xFF059669), const Color(0xFFBBF7D0)),
        _buildStatCard('Admin Sayısı', admins.toString(), Icons.shield_outlined, const Color(0xFFB45309), const Color(0xFFFDE68A)),
      ],
    );
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

  Widget _buildMainCard(bool isMobile, List<UserDto> users) {
    return Container(
      decoration: _cardDecoration(),
      child: Column(
        children: [
          _buildFilterBar(isMobile),
          const Divider(height: 1),
          _buildUserTable(isMobile, users),
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
              _buildDropdown(['Tüm Roller', 'Admin', 'Yönetici', 'Kullanıcı'], _roleFilter.isEmpty ? 'Tüm Roller' : _roleFilter, (val) => setState(() => _roleFilter = val == 'Tüm Roller' ? '' : val!)),
              _buildDropdown(['Tüm Durumlar', 'Aktif', 'Pasif'], _statusFilter.isEmpty ? 'Tüm Durumlar' : _statusFilter, (val) => setState(() => _statusFilter = val == 'Tüm Durumlar' ? '' : val!)),
              IconButton.filledTonal(
                onPressed: () => ref.read(usersProvider.notifier).loadUsers(),
                icon: const Icon(Icons.refresh, size: 20),
                style: IconButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              ),
            ],
          )
        ],
      ),
    );
  }

  /// Filter users locally based on search term, role, and status
  List<UserDto> _filterUsers(List<UserDto> users) {
    return users.where((user) {
      // Search filter
      if (_searchTerm.isNotEmpty) {
        final term = _searchTerm.toLowerCase();
        final matchesSearch = user.firstName.toLowerCase().contains(term) ||
            user.lastName.toLowerCase().contains(term) ||
            user.email.toLowerCase().contains(term);
        if (!matchesSearch) return false;
      }
      
      // Role filter
      if (_roleFilter.isNotEmpty) {
        final roleMatch = switch (_roleFilter) {
          'Admin' => user.role == UserRole.admin,
          'Yönetici' => user.role == UserRole.manager,
          'Kullanıcı' => user.role == UserRole.employee,
          _ => true,
        };
        if (!roleMatch) return false;
      }
      
      // Status filter
      if (_statusFilter.isNotEmpty) {
        final statusMatch = switch (_statusFilter) {
          'Aktif' => user.status == 'active',
          'Pasif' => user.status != 'active',
          _ => true,
        };
        if (!statusMatch) return false;
      }
      
      return true;
    }).toList();
  }

  Widget _buildUserTable(bool isMobile, List<UserDto> users) {
    final filteredUsers = _filterUsers(users);
    
    if (filteredUsers.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.people_outline, size: 48, color: Colors.grey),
              SizedBox(height: 16),
              Text('Kullanıcı bulunamadı', style: TextStyle(color: Colors.grey, fontSize: 16)),
            ],
          ),
        ),
      );
    }
    
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredUsers.length,
      separatorBuilder: (context, index) => const Divider(height: 1, indent: 20, endIndent: 20),
      itemBuilder: (context, index) {
        final user = filteredUsers[index];
        final roleStr = _getRoleString(user.role);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    _buildAvatar(user.firstName, user.lastName),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.fullName, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold, color: const Color(0xFF1E293B))),
                          Row(
                            children: [
                              const Icon(Icons.mail_outline, size: 12, color: Colors.grey),
                              const SizedBox(width: 4),
                              Flexible(child: Text(user.email, style: GoogleFonts.plusJakartaSans(fontSize: 12, color: const Color(0xFF64748B)), overflow: TextOverflow.ellipsis)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile)
                Expanded(
                  flex: 2,
                  child: _buildBadge(roleStr.toUpperCase(), _getRoleBadgeColor(user.role)),
                ),
              if (!isMobile)
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Container(width: 8, height: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: user.status == 'active' ? Colors.green : Colors.red)),
                      const SizedBox(width: 8),
                      Text(user.status == 'active' ? 'Aktif' : 'Pasif', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              Row(
                children: [
                  IconButton(onPressed: () => _showUserFormModal(context, isEdit: true, user: user), icon: const Icon(Icons.edit_outlined, size: 20, color: Color(0xFF64748B))),
                  IconButton(onPressed: () => _showDeleteConfirm(context, user), icon: const Icon(Icons.delete_outline, size: 20, color: Colors.red)),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  // --- Modal Form: Matching React Modal Logic ---
  void _showUserFormModal(BuildContext context, {required bool isEdit, UserDto? user}) {
    if (isEdit && user != null) {
      _firstNameController.text = user.firstName;
      _lastNameController.text = user.lastName;
      _emailController.text = user.email;
      _phoneController.text = user.phoneNumber ?? '';
      _departmentController.text = user.department ?? '';
      _selectedRole = _getRoleString(user.role);
    }

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Text(isEdit ? 'Kullanıcı Bilgilerini Güncelle' : 'Yeni Kullanıcı Ekle', style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800)),
          content: SizedBox(
            width: 500,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(child: _buildModalField('Ad', _firstNameController)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildModalField('Soyad', _lastNameController)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildModalField('E-posta', _emailController, keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: _buildModalField('Departman', _departmentController)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildModalField('Telefon', _phoneController, keyboardType: TextInputType.phone)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedRole,
                    decoration: _modalInputDeco('Rol'),
                    isExpanded: true,
                    items: ['Admin', 'Manager', 'Employee'].map((r) => DropdownMenuItem(value: r, child: Text(r))).toList(),
                    onChanged: (val) => setDialogState(() => _selectedRole = val!),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(isEdit ? 'Şifre Değiştir (Opsiyonel)' : 'Şifre', style: GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[600])),
                        const SizedBox(height: 12),
                        _buildModalField('Şifre', _passwordController, isPassword: true),
                        const SizedBox(height: 12),
                        _buildModalField('Şifre Onay', _confirmPasswordController, isPassword: true),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Vazgeç')),
            ElevatedButton(
              onPressed: () {
                if (isEdit && user != null) {
                  _handleUpdateUser(user.id);
                } else {
                  _handleCreateUser();
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4F46E5), foregroundColor: Colors.white),
              child: Text(isEdit ? 'Güncelle' : 'Kullanıcıyı Kaydet'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirm(BuildContext context, UserDto user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Kullanıcıyı Sil'),
        content: Text('${user.fullName} kullanıcısını silmek istediğinizden emin misiniz?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('İptal')),
          ElevatedButton(
            onPressed: () => _handleDeleteUser(user.id), 
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white), 
            child: const Text('Evet, Sil'),
          ),
        ],
      ),
    );
  }

  // --- Helpers ---
  Widget _buildAvatar(String f, String l) {
    // Handle empty strings safely
    final firstInitial = f.isNotEmpty ? f[0].toUpperCase() : '?';
    final lastInitial = l.isNotEmpty ? l[0].toUpperCase() : '';
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [Color(0xFF6366F1), Color(0xFF2563EB)])),
      alignment: Alignment.center,
      child: Text('$firstInitial$lastInitial', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
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

  Color _getRoleBadgeColor(UserRole role) {
    switch (role) {
      case UserRole.admin: return Colors.purple;
      case UserRole.manager: return Colors.blue;
      default: return Colors.teal;
    }
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

  Widget _buildModalField(String label, TextEditingController controller, {bool isPassword = false, TextInputType? keyboardType}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: _modalInputDeco(label),
    );
  }

  InputDecoration _modalInputDeco(String label) => InputDecoration(
    labelText: label,
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
  );

  BoxDecoration _cardDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: const Color(0xFFE2E8F0)),
    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
  );
}