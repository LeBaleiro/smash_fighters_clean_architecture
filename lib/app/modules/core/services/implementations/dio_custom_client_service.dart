import 'package:dio/dio.dart';

import '../interfaces/custom_client_service_interface.dart';
import '../models/custom_client_response_model.dart';

class DioCustomClientService implements ICustomClientService {
  final Dio _client;

  DioCustomClientService(this._client);

  @override
  Future<CustomClientResponseModel> get(String url, {Map<String, dynamic>? queryParameters, Map<String, String>? headers}) async {
    final response = await _client.get(url, queryParameters: queryParameters, options: Options(headers: headers));
    return CustomClientResponseModel(data: response.data, statusCode: response.statusCode);
  }
}
