import 'package:flutter_where_money_go/core/service/easy_slip_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  GetIt.instance.registerLazySingleton(() => EasySlipService());
}
