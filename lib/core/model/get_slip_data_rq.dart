import 'package:json_annotation/json_annotation.dart';

part 'get_slip_data_rq.g.dart';

@JsonSerializable()
class GetSlipDataRq {
  String image;

  GetSlipDataRq({required this.image});

  factory GetSlipDataRq.fromJson(Map<String, dynamic> json) => _$GetSlipDataRqFromJson(json);

  Map<String, dynamic> toJson() => _$GetSlipDataRqToJson(this);

  @override
  String toString() {
    return 'GetSlipDataRq{image: $image}';
  }
}
