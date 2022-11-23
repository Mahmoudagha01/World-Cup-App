import 'package:dio/dio.dart';
import 'package:world_cup/helper/constants.dart';

class APIServices {
  Future<Map<String,dynamic>> getStanding() async {
    Dio dio = Dio();
    const String url = "$baseUrl$standingsEndPoint";
    final response = await dio.get(url,
        options: Options(
            headers: {"X-Auth-Token": "a93227b5c0b0445baa865fe47b649f30"}));
   return response.data;
  }
}
