import 'dart:convert';
import 'package:flutter/services.dart';

/// Represents a single teleop statistic row
class TeleopStat {
  final String label;
  final String value;

  TeleopStat({
    required this.label,
    required this.value,
  });

  factory TeleopStat.fromJson(Map<String, dynamic> json) {
    return TeleopStat(
      label: json['label'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'value': value,
    };
  }
}

/// Represents a video option
class VideoOption {
  final String name;
  final String path;

  VideoOption({
    required this.name,
    required this.path,
  });

  factory VideoOption.fromJson(Map<String, dynamic> json) {
    return VideoOption(
      name: json['name'] as String,
      path: json['path'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'path': path,
    };
  }
}

/// Represents all scouting data
class ScoutingData {
  final String autoDescription;
  final List<VideoOption> autoVideos;
  final String defaultVideo;
  final List<TeleopStat> teleopStats;
  final DateTime lastUpdated;

  ScoutingData({
    required this.autoDescription,
    required this.autoVideos,
    required this.defaultVideo,
    required this.teleopStats,
    required this.lastUpdated,
  });

  factory ScoutingData.fromJson(Map<String, dynamic> json) {
    return ScoutingData(
      autoDescription: json['autoDescription'] as String? ?? 'No description available.',
      autoVideos: (json['autoVideos'] as List?)
              ?.map((e) => VideoOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      defaultVideo: json['defaultVideo'] as String? ?? '',
      teleopStats: (json['teleopStats'] as List?)
              ?.map((e) => TeleopStat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      lastUpdated: DateTime.tryParse(json['lastUpdated'] as String? ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'autoDescription': autoDescription,
      'autoVideos': autoVideos.map((v) => v.toJson()).toList(),
      'defaultVideo': defaultVideo,
      'teleopStats': teleopStats.map((s) => s.toJson()).toList(),
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }

  factory ScoutingData.empty() {
    return ScoutingData(
      autoDescription: 'No description available.',
      autoVideos: [],
      defaultVideo: '',
      teleopStats: [],
      lastUpdated: DateTime.now(),
    );
  }
}

/// Service to manage scouting data
class ScoutingDataService {
  static const String _configPath = 'assets/data/scouting_data.json';

  /// Load scouting data from the configuration file
  static Future<ScoutingData> loadScoutingData() async {
    try {
      final String jsonString = await rootBundle.loadString(_configPath);
      final Map<String, dynamic> json = jsonDecode(jsonString);
      return ScoutingData.fromJson(json);
    } catch (e) {
      print('Error loading scouting data: $e');
      return ScoutingData.empty();
    }
  }

  /// Convert scouting data to JSON string for saving
  static String scoutingDataToJson(ScoutingData data) {
    return jsonEncode(data.toJson());
  }

  /// Get the configuration file path for reference
  static String getConfigPath() => _configPath;
}

