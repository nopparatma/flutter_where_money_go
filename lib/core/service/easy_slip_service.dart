import 'package:flutter_where_money_go/core/model/get_slip_data_rq.dart';
import 'package:flutter_where_money_go/core/model/get_slip_data_rs.dart';
import 'package:flutter_where_money_go/core/service/base_service.dart';

class EasySlipService extends BaseService {
  static const String controllerName = 'api/v1';

  Future<GetSlipDataRs> getSlipData(GetSlipDataRq rq) async {
    return await post(
      getApiUrl(controllerName, 'verify'),
      rq.toJson(),
      (data) => GetSlipDataRs.fromJson(data),
    );
  }
}
