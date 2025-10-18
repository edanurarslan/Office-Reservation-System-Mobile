// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ofis_yonetim_sistemi/main.dart';

void main() {
  testWidgets('App should start and show splash screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: OfisYonetimSistemiApp(),
      ),
    );

    // Wait for the first frame
    await tester.pump();

    // Verify that our splash screen is shown.
    expect(find.text('Ofis Yönetim Sistemi'), findsOneWidget);
    expect(find.text('Rezervasyon ve QR Check-in Sistemi'), findsOneWidget);
    expect(find.byIcon(Icons.business), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
