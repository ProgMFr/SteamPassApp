import 'dart:convert';

UpdateInfo updateInfoModelFromJson(String str) =>
    UpdateInfo.fromJson(json.decode(str));

class UpdateInfo {
  final String version;
  final String releaseNotes;
  final String downloadUrl;
  final String releaseSize;
  final String releaseDate;
  final bool isMandatory;

  UpdateInfo({
    required this.version,
    required this.releaseNotes,
    required this.downloadUrl,
    required this.releaseSize,
    required this.releaseDate,
    required this.isMandatory,
  });

  factory UpdateInfo.fromJson(Map<String, dynamic> json) {
    return UpdateInfo(
      version: json['version'],
      releaseNotes: json['release_notes'],
      downloadUrl: json['download_url'],
      releaseSize: json['release_size'],
      releaseDate: json['release_date'],
      isMandatory: json['is_mandatory'],
    );
  }
}
