// lib/services/appwrite_constants.dart
// ─────────────────────────────────────────────────────────────────────────────
//  Fill in YOUR values after running appwrite_setup.sh
// ─────────────────────────────────────────────────────────────────────────────

class AppwriteConstants {
  AppwriteConstants._();

  /// Your Appwrite project endpoint, e.g. "https://cloud.appwrite.io/v1"
  static const String endpoint = 'https://nyc.cloud.appwrite.io/v1';

  /// Found in your Appwrite Console → Project Settings
  static const String projectId = '699cdfe4002bd02cf768';

  /// Printed at the end of appwrite_setup.sh
  static const String databaseId = '699f46ad0007565794fc';

  /// Collection IDs (set by the setup script)
  static const String matchScoutingCollectionId = 'match_scouting';
  static const String pitScoutingCollectionId   = 'pit_scouting';
}