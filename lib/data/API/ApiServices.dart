import 'package:dio/dio.dart';
import 'package:world_cup/helper/constants.dart';

class APIServices {
  Dio dio = Dio();
  Future<Map<String, dynamic>> getStanding() async {
    final response = await dio.get("$firstBaseUrl$standingsEndPoint",
        options: Options(
            headers: {"X-Auth-Token": "a93227b5c0b0445baa865fe47b649f30"}));
    return response.data;
  }

  Future<Map<String, dynamic>> getMatches() async {
    final response = await dio.get(secondBaseUrl, queryParameters: {
      "key": "demo_key",
      "secret": "demo_secret",
      "competition_id": 362,
      "from": "2022-11-20",
      "to": "2022-12-18"
    });
    return response.data;
  }
}
