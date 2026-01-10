import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/common/common.dart';
import '../../../core/theme/app_theme.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  TextStyle _headingStyle() => GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppTheme.primaryIndigo,
    height: 1.2,
    letterSpacing: -0.5,
  );

  TextStyle _messageStyle() => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppTheme.textPrimary,
    height: 1.3,
    letterSpacing: -0.2,
  );

  TextStyle _descriptionStyle() => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppTheme.textSecondary,
    height: 1.5,
    letterSpacing: 0.1,
  );

  TextStyle _buttonLabelStyle() => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.3,
    letterSpacing: 0.2,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: AppTheme.dashboardCard(),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Kullanıcılar',
                              style: _headingStyle(),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.person_add, size: 18),
                              label: const Text('Yeni Kullanıcı'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.primaryIndigo,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceLight,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppTheme.surfaceBorder,
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: AppTheme.primaryIndigo.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                Icons.people_outline,
                                size: 50,
                                color: AppTheme.primaryIndigo,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Kullanıcı Yönetimi Yakında Gelecek',
                              style: _messageStyle(),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Bu sayfada kullanıcıları görüntüleyebilir, ekleyebilir ve düzenleyebileceksiniz.',
                              textAlign: TextAlign.center,
                              style: _descriptionStyle(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
