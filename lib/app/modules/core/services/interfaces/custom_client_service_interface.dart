import '../models/custom_client_response_model.dart';

abstract class ICustomClientService {
  Future<CustomClientResponseModel> get(String url, {Map<String, dynamic>? queryParameters, Map<String, String>? headers});
}
