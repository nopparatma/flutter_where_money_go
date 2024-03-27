import 'package:json_annotation/json_annotation.dart';

part 'get_slip_data_rs.g.dart';

@JsonSerializable()
class GetSlipDataRs {
  num? status;
  Data? data;

  GetSlipDataRs({
    this.status,
    this.data,
  });

  factory GetSlipDataRs.fromJson(Map<String, dynamic> json) => _$GetSlipDataRsFromJson(json);

  Map<String, dynamic> toJson() => _$GetSlipDataRsToJson(this);
}

@JsonSerializable()
class Data {
  String? payload;
  String? transRef;
  DateTime? date;
  String? countryCode;
  Amount? amount;
  num? fee;
  String? ref1;
  String? ref2;
  String? ref3;
  Receiver? sender;
  Receiver? receiver;

  Data({
    this.payload,
    this.transRef,
    this.date,
    this.countryCode,
    this.amount,
    this.fee,
    this.ref1,
    this.ref2,
    this.ref3,
    this.sender,
    this.receiver,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Amount {
  num? amount;
  Local? local;

  Amount({
    this.amount,
    this.local,
  });

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);

  Map<String, dynamic> toJson() => _$AmountToJson(this);
}

@JsonSerializable()
class Local {
  num? amount;
  String? currency;

  Local({
    this.amount,
    this.currency,
  });

  factory Local.fromJson(Map<String, dynamic> json) => _$LocalFromJson(json);

  Map<String, dynamic> toJson() => _$LocalToJson(this);
}

@JsonSerializable()
class Receiver {
  ReceiverBank? bank;
  Account? account;

  Receiver({
    this.bank,
    this.account,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) => _$ReceiverFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiverToJson(this);
}

@JsonSerializable()
class Account {
  Name? name;
  AccountBank? bank;

  Account({
    this.name,
    this.bank,
  });

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}

@JsonSerializable()
class AccountBank {
  String? type;
  String? account;

  AccountBank({
    this.type,
    this.account,
  });

  factory AccountBank.fromJson(Map<String, dynamic> json) => _$AccountBankFromJson(json);

  Map<String, dynamic> toJson() => _$AccountBankToJson(this);
}

@JsonSerializable()
class Name {
  String? th;
  String? en;

  Name({
    this.th,
    this.en,
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable()
class ReceiverBank {
  String? id;
  String? name;
  String? short;

  ReceiverBank({
    this.id,
    this.name,
    this.short,
  });

  factory ReceiverBank.fromJson(Map<String, dynamic> json) => _$ReceiverBankFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiverBankToJson(this);
}
