import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:steampass/utils/constants/config.dart";

// Function to check GitHub API rate limit
Future<Map> checkRateLimit() async {
  final String githubApi = ConfigConstants.githubBaseUrl;
  Dio client = Dio();
  final String url = "$githubApi/rate_limit";
  try {
    final Response request = await client.get(url);
    if (request.statusCode == 200) {
      final Map<String, dynamic> rateLimit = request.data["rate"];
      final int remaining = rateLimit["remaining"] ?? 0;
      final int resetTime = rateLimit["reset"] ?? 0;
      final String resetFormatted = DateTime.fromMillisecondsSinceEpoch(
        resetTime * 1000,
      ).toLocal().toString().substring(0, 19);
      if (kDebugMode) {
        print("remaing usage: $remaining\nreset time: $resetFormatted");
      }

      if (remaining == 0) {
        if (kDebugMode) {
          print("reset time: $resetFormatted");
        }
        return {"status": "limitReached", "resetTime": resetFormatted};
      }
      return {"status": "ok", "resetTime": resetFormatted};
    } else {
      return {"status": "Error", "resetTime": null};
    }
  } catch (e) {
    if (kDebugMode) {
      print("Error: ${e.toString()}");
    }
    return {"status": "Error", "resetTime": null};
  }
}
