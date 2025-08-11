import 'dart:io';

import 'package:dio/dio.dart';
import 'package:steampass/core/service_locator.dart';
import 'package:steampass/domain/data/local/adapters/game_model.dart';
import 'package:steampass/domain/data/models/steam_search_model.dart';
import 'package:steampass/domain/data/repositories/saved_game_repo.dart';
import 'package:steampass/utils/constants/config.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:steampass/utils/helpers/registry_search_helper.dart';

final dio = Dio();
GameRepository getGameRepo = getIt<GameRepository>();

Future searchGameGithub(String value) async {
  try {
    final response = await dio.get(
      '${ConfigConstants.githubBaseUrl}/repos/${ConfigConstants.manifestRepo}/branches/$value',

      options: Options(
        headers: {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
        },
      ),
    );
    if (response.statusCode == 200) {
      print(response.data['commit']['commit']['tree']['url']);
      print(response.data['commit']['sha']);

      try {
        final treeResponse = await dio.get(
          response.data['commit']['commit']['tree']['url'],
        );
        if (response.statusCode == 200) {
          return {
            'url': response.data['commit']['commit']['tree']['url'],
            'sha': response.data['commit']['sha'],
            'tree': treeResponse.data['tree'],
          };
        }
      } on DioException {
        rethrow;
      }
    }
  } on DioException catch (e) {
    print(e.type);

    if (e.type == DioExceptionType.badResponse) {
      if (e.response!.statusCode == 404) {
        throw 'GameNotFoundGithub';
      }
      if (e.response!.statusCode == 429 || e.response!.statusCode == 403) {
        throw 'GithubReachLimit';
      }
    }
    if (e.type == DioExceptionType.connectionError) {
      throw 'ConnectionError';
    }
  }
}

Future<String> downloadDllFile() async {
  final steamPath = getSteamPathFromRegistry();
  final dllPath = path.join(steamPath!, 'hid.dll');
  try {
    final url = ConfigConstants.dllDownloadUrl;
    final res = await dio.download(
      url,
      dllPath,
      options: Options(
        headers: {
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
        },
      ),
    );
    if (res.statusCode == 200) {
      print('DLL file downloaded successfully to $dllPath');

      return "success";
    }
  } on DioException catch (e) {
    print('Error downloading DLL file: ${e.message}');
    if (e.type == DioExceptionType.badResponse) {
      if (e.response!.statusCode == 404) {
        throw ('dLLFileNotFound');
      }
      if (e.response!.statusCode == 429 || e.response!.statusCode == 403) {
        throw ('GithubReachLimit');
      }
    }
    if (e.type == DioExceptionType.connectionError) {
      throw ('connectionError');
    }
  }
  return "error";
}

Future<String> getManifestFiles(
  Map gameInfo,
  Function progress,
  Function updateIndicator,
  Function updateProgressFile,
  String steamPath,
  GameItem gameDetails,
) async {
  int completedTask = 2;
  int completedFiles = 0;
  int totalFiles = 0;
  List<String> installedFiles = [];
  for (var file in gameInfo['tree']) {
    if (file['path'].endsWith('.manifest') || file['path'].endsWith('.lua')) {
      totalFiles++;
    }
  }
  int totalProgress = 2 + totalFiles;
  final Directory steamDepotsPath = Directory(
    path.join(steamPath, 'config', 'depotcache'),
  );
  final Directory luaManifestPath = Directory(
    path.join(steamPath, 'config', 'stplug-in'),
  );
  if (!await steamDepotsPath.exists()) {
    await steamDepotsPath.create(recursive: true);
  }

  if (!await luaManifestPath.exists()) {
    await luaManifestPath.create(recursive: true);
  }
  for (var file in gameInfo['tree']) {
    if (file['path'].endsWith('.manifest') || file['path'].endsWith('.lua')) {
      final fileName = path.basename(file['path']);
      final filePath =
          (file['path'].endsWith('.manifest')
              ? path.join(steamDepotsPath.path, fileName)
              : path.join(luaManifestPath.path, fileName));
      for (int i = 0; i < ConfigConstants.gitDownloadSources.length; i++) {
        final finalUrl = ConfigConstants.gitDownloadSources[i]
            .toString()
            .replaceAll("{sha}", gameInfo['sha'])
            .replaceAll("{repo}", ConfigConstants.manifestRepo)
            .replaceAll("{path}", file['path']);

        print("trying: $finalUrl");
        try {
          updateProgressFile(fileName);
          final response = await dio.download(
            finalUrl,
            filePath,

            options: Options(
              headers: {
                'User-Agent':
                    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
              },
            ),
          );
          if (response.statusCode == 200) {
            completedTask++;
            completedFiles++;
            installedFiles.add(filePath);
            progress(
              completedFiles / totalFiles * 100,
              totalFiles,
              completedFiles,
            );
            updateIndicator((completedTask / totalProgress) * 100);
          }
          print("success :$finalUrl");
          break;
        } on DioException catch (e) {
          print('Error downloading file: ${file['path']}');
          if (e.type == DioExceptionType.badResponse) {
            print(e.response!.statusCode);

            if (e.response!.statusCode == 404) {
              throw 'errorManifestNotFound';
            }
            if (e.response!.statusCode == 429 ||
                e.response!.statusCode == 403) {
              throw 'GithubReachLimit';
            }
          }
          if (e.type == DioExceptionType.connectionError) {
            throw 'connectionError';
          }
        }
      } // End All Download Sources loop
    }
  } // End Download files loop

  final game = Game(
    id: gameDetails.id.toString(),
    name: gameDetails.name.toString(),
    image: gameDetails.tinyImage.toString(),
    price: gameDetails.price?.priceFinal.toString(),
    files: installedFiles,
  );

  getGameRepo.addGame(game);

  return "success";
}
