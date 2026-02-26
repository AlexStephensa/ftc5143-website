// lib/services/appwrite_service.dart
// ─────────────────────────────────────────────────────────────────────────────
//  Singleton that wraps all Appwrite Database calls for Xcentrics Scouting.
//
//  Add to pubspec.yaml:
//    dependencies:
//      appwrite: ^13.0.0
// ─────────────────────────────────────────────────────────────────────────────

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;

import 'appwrite_constants.dart';

// ── Data models ───────────────────────────────────────────────────────────────

class MatchScoutingEntry {
  final int matchNumber;
  final int teamNumber;
  final String scoutName;
  final int autoShotsAttempted;
  final int autoShotsMade;
  final int teleopShotsAttempted;
  final int teleopShotsMade;
  final String parkStatus; // "full" | "partial" | "none"
  final String notes;

  const MatchScoutingEntry({
    required this.matchNumber,
    required this.teamNumber,
    this.scoutName = '',
    required this.autoShotsAttempted,
    required this.autoShotsMade,
    required this.teleopShotsAttempted,
    required this.teleopShotsMade,
    required this.parkStatus,
    this.notes = '',
  });

  Map<String, dynamic> toMap() => {
    'matchNumber': matchNumber,
    'teamNumber': teamNumber,
    'scoutName': scoutName,
    'autoShotsAttempted': autoShotsAttempted,
    'autoShotsMade': autoShotsMade,
    'teleopShotsAttempted': teleopShotsAttempted,
    'teleopShotsMade': teleopShotsMade,
    'parkStatus': parkStatus,
    'notes': notes,
    'submittedAt': DateTime.now().toIso8601String(),
  };

  factory MatchScoutingEntry.fromDocument(models.Document doc) =>
      MatchScoutingEntry(
        matchNumber: doc.data['matchNumber'] ?? 0,
        teamNumber: doc.data['teamNumber'] ?? 0,
        scoutName: doc.data['scoutName'] ?? '',
        autoShotsAttempted: doc.data['autoShotsAttempted'] ?? 0,
        autoShotsMade: doc.data['autoShotsMade'] ?? 0,
        teleopShotsAttempted: doc.data['teleopShotsAttempted'] ?? 0,
        teleopShotsMade: doc.data['teleopShotsMade'] ?? 0,
        parkStatus: doc.data['parkStatus'] ?? 'none',
        notes: doc.data['notes'] ?? '',
      );
}

class PitScoutingEntry {
  final int teamNumber;
  final String teamName;
  final String robotWeight;
  final String drivetrainType;
  final bool canShoot;
  final bool canSort;
  final bool hasAuto;
  final String autoCloseBlue;
  final String autoCloseRed;
  final String autoFarBlue;
  final String autoFarRed;
  final String strengths;
  final String weaknesses;
  final String notes;

  const PitScoutingEntry({
    required this.teamNumber,
    this.teamName = '',
    this.robotWeight = '',
    this.drivetrainType = '',
    this.canShoot = false,
    this.canSort = false,
    this.hasAuto = false,
    this.autoCloseBlue = '',
    this.autoCloseRed = '',
    this.autoFarBlue = '',
    this.autoFarRed = '',
    this.strengths = '',
    this.weaknesses = '',
    this.notes = '',
  });

  Map<String, dynamic> toMap() => {
    'teamNumber': teamNumber,
    'teamName': teamName,
    'robotWeight': robotWeight,
    'drivetrainType': drivetrainType,
    'canShoot': canShoot,
    'canSort': canSort,
    'hasAuto': hasAuto,
    'autoCloseBlue': autoCloseBlue,
    'autoCloseRed': autoCloseRed,
    'autoFarBlue': autoFarBlue,
    'autoFarRed': autoFarRed,
    'strengths': strengths,
    'weaknesses': weaknesses,
    'notes': notes,
    'submittedAt': DateTime.now().toIso8601String(),
  };

  factory PitScoutingEntry.fromDocument(models.Document doc) => PitScoutingEntry(
    teamNumber: doc.data['teamNumber'] ?? 0,
    teamName: doc.data['teamName'] ?? '',
    robotWeight: doc.data['robotWeight'] ?? '',
    drivetrainType: doc.data['drivetrainType'] ?? '',
    canShoot: doc.data['canShoot'] ?? false,
    canSort: doc.data['canSort'] ?? false,
    hasAuto: doc.data['hasAuto'] ?? false,
    autoCloseBlue: doc.data['autoCloseBlue'] ?? '',
    autoCloseRed: doc.data['autoCloseRed'] ?? '',
    autoFarBlue: doc.data['autoFarBlue'] ?? '',
    autoFarRed: doc.data['autoFarRed'] ?? '',
    strengths: doc.data['strengths'] ?? '',
    weaknesses: doc.data['weaknesses'] ?? '',
    notes: doc.data['notes'] ?? '',
  );
}

// ── Service ───────────────────────────────────────────────────────────────────

class AppwriteService {
  AppwriteService._internal();
  static final AppwriteService instance = AppwriteService._internal();

  late final Client _client;
  late final Databases _db;

  /// Call once in main() before runApp().
  void init() {
    _client = Client()
      ..setEndpoint(AppwriteConstants.endpoint)
      ..setProject(AppwriteConstants.projectId)
      ..setSelfSigned(status: false); // set true only for self-hosted dev
    _db = Databases(_client);
  }

  // ── Match Scouting ─────────────────────────────────────────────────────────

  /// Submit a new match scouting entry.
  Future<models.Document> submitMatchScouting(MatchScoutingEntry entry) async {
    return _db.createDocument(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.matchScoutingCollectionId,
      documentId: ID.unique(),
      data: entry.toMap(),
    );
  }

  /// Fetch all entries for a specific match number.
  Future<List<MatchScoutingEntry>> getMatchEntries(int matchNumber) async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.matchScoutingCollectionId,
      queries: [Query.equal('matchNumber', matchNumber)],
    );
    return result.documents.map(MatchScoutingEntry.fromDocument).toList();
  }

  /// Fetch all entries for a specific team number.
  Future<List<MatchScoutingEntry>> getTeamMatchEntries(int teamNumber) async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.matchScoutingCollectionId,
      queries: [Query.equal('teamNumber', teamNumber)],
    );
    return result.documents.map(MatchScoutingEntry.fromDocument).toList();
  }

  /// Fetch ALL match scouting entries (ordered newest first).
  Future<List<MatchScoutingEntry>> getAllMatchEntries() async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.matchScoutingCollectionId,
      queries: [Query.orderDesc('submittedAt')],
    );
    return result.documents.map(MatchScoutingEntry.fromDocument).toList();
  }

  // ── Pit Scouting ───────────────────────────────────────────────────────────

  /// Submit a new pit scouting entry.
  Future<models.Document> submitPitScouting(PitScoutingEntry entry) async {
    return _db.createDocument(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.pitScoutingCollectionId,
      documentId: ID.unique(),
      data: entry.toMap(),
    );
  }

  /// Fetch the pit scouting entry for a specific team (returns null if none).
  Future<PitScoutingEntry?> getPitEntry(int teamNumber) async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.pitScoutingCollectionId,
      queries: [
        Query.equal('teamNumber', teamNumber),
        Query.limit(1),
      ],
    );
    if (result.documents.isEmpty) return null;
    return PitScoutingEntry.fromDocument(result.documents.first);
  }

  /// Fetch ALL pit scouting entries.
  Future<List<PitScoutingEntry>> getAllPitEntries() async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.pitScoutingCollectionId,
      queries: [Query.orderDesc('submittedAt')],
    );
    return result.documents.map(PitScoutingEntry.fromDocument).toList();
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  /// Returns a distinct, sorted list of all team numbers across both collections.
  Future<List<int>> getAllTeamNumbers() async {
    final matchDocs = await _db.listDocuments(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.matchScoutingCollectionId,
      queries: [Query.limit(500)],
    );
    final pitDocs = await _db.listDocuments(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.pitScoutingCollectionId,
      queries: [Query.limit(500)],
    );

    final teams = <int>{
      ...matchDocs.documents.map((d) => d.data['teamNumber'] as int),
      ...pitDocs.documents.map((d) => d.data['teamNumber'] as int),
    }.toList()
      ..sort();
    return teams;
  }

  /// Returns a distinct, sorted list of all match numbers.
  Future<List<int>> getAllMatchNumbers() async {
    final result = await _db.listDocuments(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.matchScoutingCollectionId,
      queries: [Query.limit(500)],
    );
    final matches = result.documents
        .map((d) => d.data['matchNumber'] as int)
        .toSet()
        .toList()
      ..sort();
    return matches;
  }
}