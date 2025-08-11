import 'package:dio/dio.dart';
import 'package:steampass/utils/constants/config.dart';

import '../data/models/steam_search_model.dart';

abstract class SearchGameRepository {
  Future<SteamSearchModel?> searchGame(String value);
}

class SearchGameRepositoryImpl implements SearchGameRepository {
  final Dio _dio;
  SearchGameRepositoryImpl(this._dio);
  @override
  Future<SteamSearchModel?> searchGame(String value) async {
    try {
      final response = await _dio.get(
        ConfigConstants.steamApiSearchUrl,
        queryParameters: {'cc': 'US', 'term': value, 'limit': 20},
        options: Options(
          headers: {
            'User-Agent':
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
          },
        ),
      );
      if (response.statusCode == 200 && response.data['total'] != 0) {
        print('Search successful: ${response.data['total']} results found');
        final basicSearchModel = SteamSearchModel.fromJson(response.data);
        return basicSearchModel;
      } else if (response.statusCode == 200 && response.data['total'] == 0) {
        throw 'noResultsFound';
      }
    } on DioException catch (e) {
      print('Error status code: ${e.response?.statusCode}');
      print('Dio error without response: ${e.message}');
      throw 'error: $e';
    }
    return null;
  }
}
