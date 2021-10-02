import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'services/implementations/connectivity_network_info_service.dart';
import 'services/implementations/dio_custom_client_service.dart';
import 'services/implementations/hive_cache_service.dart';

export 'services/interfaces/cache_service_interface.dart';
export 'services/interfaces/custom_client_service_interface.dart';
export 'services/interfaces/network_info_service_interface.dart';
export 'services/models/custom_client_response_model.dart';

class CoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //Services
        Bind.lazySingleton((i) => ConnectivityNetworkInfoService(i()), export: true),
        Bind.lazySingleton((i) => DioCustomClientService(i()), export: true),
        Bind.lazySingleton((i) => HiveCacheService(), export: true),
        //Others
        Bind.lazySingleton((i) => Connectivity(), export: true),
        Bind.lazySingleton((i) => Dio(BaseOptions(baseUrl: 'https://593cdf8fb56f410011e7e7a9.mockapi.io/')), export: true),
      ];
}
