// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_slip_data_rs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSlipDataRs _$GetSlipDataRsFromJson(Map<String, dynamic> json) =>
    GetSlipDataRs(
      status: json['status'] as num?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSlipDataRsToJson(GetSlipDataRs instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      payload: json['payload'] as String?,
      transRef: json['transRef'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      countryCode: json['countryCode'] as String?,
      amount: json['amount'] == null
          ? null
          : Amount.fromJson(json['amount'] as Map<String, dynamic>),
      fee: json['fee'] as num?,
      ref1: json['ref1'] as String?,
      ref2: json['ref2'] as String?,
      ref3: json['ref3'] as String?,
      sender: json['sender'] == null
          ? null
          : Receiver.fromJson(json['sender'] as Map<String, dynamic>),
      receiver: json['receiver'] == null
          ? null
          : Receiver.fromJson(json['receiver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'payload': instance.payload,
      'transRef': instance.transRef,
      'date': instance.date?.toIso8601String(),
      'countryCode': instance.countryCode,
      'amount': instance.amount,
      'fee': instance.fee,
      'ref1': instance.ref1,
      'ref2': instance.ref2,
      'ref3': instance.ref3,
      'sender': instance.sender,
      'receiver': instance.receiver,
    };

Amount _$AmountFromJson(Map<String, dynamic> json) => Amount(
      amount: json['amount'] as num?,
      local: json['local'] == null
          ? null
          : Local.fromJson(json['local'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AmountToJson(Amount instance) => <String, dynamic>{
      'amount': instance.amount,
      'local': instance.local,
    };

Local _$LocalFromJson(Map<String, dynamic> json) => Local(
      amount: json['amount'] as num?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$LocalToJson(Local instance) => <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
    };

Receiver _$ReceiverFromJson(Map<String, dynamic> json) => Receiver(
      bank: json['bank'] == null
          ? null
          : ReceiverBank.fromJson(json['bank'] as Map<String, dynamic>),
      account: json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReceiverToJson(Receiver instance) => <String, dynamic>{
      'bank': instance.bank,
      'account': instance.account,
    };

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      name: json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      bank: json['bank'] == null
          ? null
          : AccountBank.fromJson(json['bank'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'name': instance.name,
      'bank': instance.bank,
    };

AccountBank _$AccountBankFromJson(Map<String, dynamic> json) => AccountBank(
      type: json['type'] as String?,
      account: json['account'] as String?,
    );

Map<String, dynamic> _$AccountBankToJson(AccountBank instance) =>
    <String, dynamic>{
      'type': instance.type,
      'account': instance.account,
    };

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      th: json['th'] as String?,
      en: json['en'] as String?,
    );

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'th': instance.th,
      'en': instance.en,
    };

ReceiverBank _$ReceiverBankFromJson(Map<String, dynamic> json) => ReceiverBank(
      id: json['id'] as String?,
      name: json['name'] as String?,
      short: json['short'] as String?,
    );

Map<String, dynamic> _$ReceiverBankToJson(ReceiverBank instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'short': instance.short,
    };
