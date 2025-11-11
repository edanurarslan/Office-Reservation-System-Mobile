import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_layout.dart';
import '../../core/theme/app_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      currentRoute: '/settings',
      title: 'Ayarlar',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Profile Settings
                Container(
                  decoration: AppTheme.dashboardCard(),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppTheme.surfaceLight,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(Icons.person, color: AppTheme.primaryIndigo),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Profil Ayarları',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primaryIndigo,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildSettingItem('İsim', 'Dev User', Icons.edit),
                      _buildSettingItem('E-posta', 'dev@ofis.com', Icons.edit),
                      _buildSettingItem('Telefon', '+90 555 123 45 67', Icons.edit),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                
                // Notification Settings
                Container(
                  decoration: AppTheme.dashboardCard(),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppTheme.surfaceLight,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(Icons.notifications, color: AppTheme.primaryIndigo),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Bildirim Ayarları',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primaryIndigo,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildSwitchItem('E-posta Bildirimleri', true),
                      _buildSwitchItem('Push Bildirimleri', true),
                      _buildSwitchItem('Rezervasyon Hatırlatıcıları', true),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                
                // App Settings
                Container(
                  decoration: AppTheme.dashboardCard(),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppTheme.surfaceLight,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(Icons.settings, color: AppTheme.primaryIndigo),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Uygulama Ayarları',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primaryIndigo,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildSettingItem('Dil', 'Türkçe', Icons.language),
                      _buildSettingItem('Tema', 'Açık', Icons.palette),
                      _buildSettingItem('Sürüm', '1.0.0', Icons.info),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                // Logout Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    icon: const Icon(Icons.logout),
                    label: Text(
                      'Çıkış Yap',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          Icon(icon, size: 20, color: AppTheme.textSecondary),
        ],
      ),
    );
  }

  Widget _buildSwitchItem(String label, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppTheme.textPrimary,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: (newValue) {},
            activeColor: AppTheme.primaryIndigo,
          ),
        ],
      ),
    );
  }
}
