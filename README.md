# TR
# OFIS YONETIM SISTEMI - FLUTTER GELISTIRME

## Hizli Baslarsa

### Gerekli Komutlar
```bash
cd ofis_yonetim_sistemi
flutter clean && flutter pub get
flutter run -d chrome
```

### Login Kredileri
- Admin: `admin@example.com`
- Manager: `manager@example.com`
- Employee: `employee@example.com`

---

## Mimariye Genel Bakis

### Sayfalar ve Rolleri
```
HomePage (Anasayfa)
  - Ozet kartlar
  - Hizli islem butonlari
  - Kullanici karsilastirmasi

ReservationsPage (Rezervasyonlar)
  - Olusan rezervasyon listesi
  - Yeni rezervasyon dialog'u
  - Edit/Iptal fonksiyonlari

ResourcesPage (Kaynaklar)
  - Tum kaynaklar grid'de
  - Resource detay bilgisi
  - Filtreleme secenekleri

RoomsPage (Odalar)
  - Sadece odalari gosterir
  - Detay bilgisi ve kapasite
  - Rezervasyon butonlari

Admin Sayfalar
  - Users: Kullanici yonetimi
  - Reports: Raporlar
  - Logs: Sistem gunlukleri
  - Overview: Yonetim ozeti
  - Backup: Veri yedeklemesi
  - Rules: Sistem kurallar
  - Floorplan: Kat plani

Manager Sayfalar
  - Approval: Onay bekleyen islemler
  - Reports: Manager raporlari
  - Logs: Aktivite gunlukleri
  - Users: Takip edilen kullanicilar

Employee Sayfalar
  - Locations: Lokasyonlar
  - Notifications: Bildirimler
  - Settings: Ayarlar
  - QR: QR kod tarama
```

---

## Teknik Yigini (Tech Stack)

| Alan | Teknoloji |
|------|-----------|
| Framework | Flutter/Dart (Null-Safe) |
| State Management | Riverpod |
| Routing | GoRouter |
| HTTP | Dio |
| Local Storage | Hive (Plannied), SecureStorage |
| Code Generation | Freezed, json_serializable |
| UI | Material Design + Google Fonts |
| Backend | .NET (Planned API) |

---

## Dosya Yapisi (Onemli Dosyalar)

```
lib/
├── core/routing/
│   └── app_router.dart (TAMAMLANDI - 17 route)
│
├── infrastructure/seed/
│   └── seed_resources.dart (TAMAMLANDI - 5 kaynak)
│
├── presentation/pages/
│   ├── resources_page.dart (TAMAMLANDI)
│   ├── rooms_page.dart (TAMAMLANDI)
│   ├── employee/
│   │   ├── reservations_page.dart (GUNCELLENDI)
│   │   └── diğer sayfalar
│   ├── admin/ (ROUTE DUZELTILDI)
│   └── manager/ (ROUTE DUZELTILDI)
│
└── presentation/widgets/common/
    ├── app_layout.dart (Ana wrapper)
    └── app_sidebar.dart (Navigasyon)
```

---

## Test Senaryolari

### Senaryo 1: Navigasyon Testi
```
1. admin@ofis.com ile giris yap
2. Sidebar'da tum butonlara tikla
3. Her buton dogru sayfaya gittigini dogrula
4. Sidebar tum sayfalarda goruluyor mu kontrol et
```

### Senaryo 2: Rezervasyon Olusturma
```
1. employee@ofis.com ile giris yap
2. "Rezervasyon Yap" butonu tikla
3. Resource sec (dropdown'dan)
4. Tarih ve saat sec
5. "Olustur" tikla
6. Basarili bildirim gelmesi geri
```

### Senaryo 3: Resources/Rooms Sayfasi
```
1. "Kaynaklar" butonu tikla -> ResourcesPage acilmali
2. "Odalar" butonu tikla -> RoomsPage acilmali
3. Her iki sayfada sidebar goruntu olmali
```

---

## Destek ve Sorular

### Yeni Ozellik Eklemek Istiyorum
1. Sayfa klasorune dosya olustur
2. ConsumerWidget extend et
3. AppLayout wrapper'i ekle (currentRoute onemli!)
4. app_router.dart'a route ekle
5. app_sidebar.dart'a buton ekle

### Bug'i Nasil Raporlayayim?
1. Adimlar (Replike etmek icin)
2. Kullanici tipi
3. Beklenen vs Gercek sonuc
4. Error mesaji (varsa)

---

## Hizli Referanslar

### Route Listesi
```dart
/home              HomePage (Tum roller)
/reservations      ReservationsPage (Tum roller)
/qr                QrPage (Tum roller)
/settings          SettingsPage (Tum roller)
/admin             AdminPage (Admin)
/users             UsersPage (Admin)
/reports           ReportsPage (Admin)
/logs              LogsPage (Admin)
/overview          OverviewPage (Admin)
/backup            BackupPage (Admin)
/rules             RulesPage (Admin)
/floorplan         FloorplanPage (Admin)
/api-test          ApiTestPage (Admin)
/approval          ApprovalPage (Manager)
/manager-logs      ManagerLogsPage (Manager)
/manager-reports   ManagerReportsPage (Manager)
/manager-users     ManagerUsersPage (Manager)
/manager-notifications ManagerNotificationsPage (Manager)
/locations         LocationsPage (Employee)
/notifications     NotificationsPage (Employee)
/resources         ResourcesPage (Employee)
/rooms             RoomsPage (Employee)
```

---
# ENG
# OFFICE MANAGEMENT SYSTEM – FLUTTER DEVELOPMENT

## Quick Start

### Required Commands

```bash
cd ofis_yonetim_sistemi
flutter clean && flutter pub get
flutter run -d chrome
```

### Login Credentials

* Admin: `admin@ofis.com`
* Manager: `manager@ofis.com`
* Employee: `employee@ofis.com`

---

## Overview of the Architecture

### Pages and Their Roles

```
HomePage
  - Summary cards
  - Quick action buttons
  - User-specific welcome information

ReservationsPage
  - List of created reservations
  - New reservation dialog
  - Edit/Cancel actions

ResourcesPage
  - All resources displayed in a grid
  - Resource detail information
  - Filtering options

RoomsPage
  - Shows only rooms
  - Details & capacity info
  - Reservation buttons

Admin Pages
  - Users: User management
  - Reports: Administrative reports
  - Logs: System logs
  - Overview: Management summary
  - Backup: Data backup
  - Rules: System rules
  - Floorplan: Floor plan

Manager Pages
  - Approval: Pending approvals
  - Reports: Manager reports
  - Logs: Activity logs
  - Users: Managed users

Employee Pages
  - Locations: Locations
  - Notifications: Notifications
  - Settings: Settings
  - QR: QR code scanning
```

---

## Tech Stack

| Area             | Technology                     |
| ---------------- | ------------------------------ |
| Framework        | Flutter/Dart (Null-Safe)       |
| State Management | Riverpod                       |
| Routing          | GoRouter                       |
| HTTP             | Dio                            |
| Local Storage    | Hive (Planned), SecureStorage  |
| Code Generation  | Freezed, json_serializable     |
| UI               | Material Design + Google Fonts |
| Backend          | .NET (Planned API)             |

---

## File Structure (Important Files)

```
lib/
├── core/routing/
│   └── app_router.dart (COMPLETED – 17 routes)
│
├── infrastructure/seed/
│   └── seed_resources.dart (COMPLETED – 5 resources)
│
├── presentation/pages/
│   ├── resources_page.dart (COMPLETED)
│   ├── rooms_page.dart (COMPLETED)
│   ├── employee/
│   │   ├── reservations_page.dart (UPDATED)
│   │   └── other employee pages
│   ├── admin/ (ROUTES FIXED)
│   └── manager/ (ROUTES FIXED)
│
└── presentation/widgets/common/
    ├── app_layout.dart (Main layout wrapper)
    └── app_sidebar.dart (Navigation)
```

---

## Test Scenarios

### Scenario 1: Navigation Test

```
1. Log in using admin@ofis.com
2. Click all buttons in the sidebar
3. Verify each button navigates to the correct page
4. Ensure the sidebar is visible on all pages
```

### Scenario 2: Create a Reservation

```
1. Log in using employee@ofis.com
2. Click “Create Reservation”
3. Select a resource from the dropdown
4. Choose date and time
5. Click “Create”
6. A success message should appear
```

### Scenario 3: Resources/Rooms Pages

```
1. Click “Resources” → ResourcesPage should open
2. Click “Rooms” → RoomsPage should open
3. Sidebar must remain visible on both pages
```

---

## Support & Questions

### I Want to Add a New Feature

1. Create a file inside the related page folder
2. Extend `ConsumerWidget`
3. Wrap it inside `AppLayout` (currentRoute is important!)
4. Add the route to `app_router.dart`
5. Add the button to `app_sidebar.dart`

### How to Report a Bug?

1. Steps to reproduce
2. User role
3. Expected vs actual behavior
4. Error message (if any)

---

## Quick References

### Route List

```dart
/home              HomePage (All roles)
/reservations      ReservationsPage (All roles)
/qr                QrPage (All roles)
/settings          SettingsPage (All roles)
/admin             AdminPage (Admin)
/users             UsersPage (Admin)
/reports           ReportsPage (Admin)
/logs              LogsPage (Admin)
/overview          OverviewPage (Admin)
/backup            BackupPage (Admin)
/rules             RulesPage (Admin)
/floorplan         FloorplanPage (Admin)
/api-test          ApiTestPage (Admin)
/approval          ApprovalPage (Manager)
/manager-logs      ManagerLogsPage (Manager)
/manager-reports   ManagerReportsPage (Manager)
/manager-users     ManagerUsersPage (Manager)
/manager-notifications ManagerNotificationsPage (Manager)
/locations         LocationsPage (Employee)
/notifications     NotificationsPage (Employee)
/resources         ResourcesPage (Employee)
/rooms             RoomsPage (Employee)
```

---
