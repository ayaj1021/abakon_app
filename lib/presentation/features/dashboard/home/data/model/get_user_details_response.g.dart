// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUserDetailsResponse _$GetAllUserDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllUserDetailsResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
      name: json['name'] as String?,
      allDetails: json['all_details'] == null
          ? null
          : AllDetails.fromJson(json['all_details'] as Map<String, dynamic>),
      balance: json['balance'] as String?,
    );

Map<String, dynamic> _$GetAllUserDetailsResponseToJson(
        GetAllUserDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'name': instance.name,
      'all_details': instance.allDetails,
      'balance': instance.balance,
    };

AllDetails _$AllDetailsFromJson(Map<String, dynamic> json) => AllDetails(
      sId: (json['sId'] as num?)?.toInt(),
      sApiKey: json['sApiKey'] as String?,
      sFname: json['sFname'] as String?,
      sLname: json['sLname'] as String?,
      sEmail: json['sEmail'] as String?,
      sPhone: json['sPhone'] as String?,
      sPass: json['sPass'] as String?,
      sState: json['sState'] as String?,
      sPin: (json['sPin'] as num?)?.toInt(),
      sPinStatus: (json['sPinStatus'] as num?)?.toInt(),
      sNin: json['sNin'] as String?,
      sBvn: json['sBvn'] as String?,
      sRef: json['sRef'],
      sType: (json['sType'] as num?)?.toInt(),
      sWallet: (json['sWallet'] as num?)?.toInt(),
      sRefWallet: (json['sRefWallet'] as num?)?.toInt(),
      sBankNo: json['sBankNo'],
      sRolexBank: json['sRolexBank'],
      sSterlingBank: json['sSterlingBank'],
      sFidelityBank: json['sFidelityBank'],
      sBankName: json['sBankName'],
      sRegStatus: (json['sRegStatus'] as num?)?.toInt(),
      sVerCode: (json['sVerCode'] as num?)?.toInt(),
      sRegDate: json['sRegDate'] == null
          ? null
          : DateTime.parse(json['sRegDate'] as String),
      sLastActivity: json['sLastActivity'],
      sReferal: json['sReferal'] as String?,
      sPayvesselBank: json['sPayvesselBank'],
      sDob: json['sDob'],
      sKycStatus: json['sKycStatus'],
      accountReference: json['accountReference'],
    );

Map<String, dynamic> _$AllDetailsToJson(AllDetails instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'sApiKey': instance.sApiKey,
      'sFname': instance.sFname,
      'sLname': instance.sLname,
      'sEmail': instance.sEmail,
      'sPhone': instance.sPhone,
      'sPass': instance.sPass,
      'sState': instance.sState,
      'sPin': instance.sPin,
      'sPinStatus': instance.sPinStatus,
      'sNin': instance.sNin,
      'sBvn': instance.sBvn,
      'sRef': instance.sRef,
      'sType': instance.sType,
      'sWallet': instance.sWallet,
      'sRefWallet': instance.sRefWallet,
      'sBankNo': instance.sBankNo,
      'sRolexBank': instance.sRolexBank,
      'sSterlingBank': instance.sSterlingBank,
      'sFidelityBank': instance.sFidelityBank,
      'sBankName': instance.sBankName,
      'sRegStatus': instance.sRegStatus,
      'sVerCode': instance.sVerCode,
      'sRegDate': instance.sRegDate?.toIso8601String(),
      'sLastActivity': instance.sLastActivity,
      'sReferal': instance.sReferal,
      'sPayvesselBank': instance.sPayvesselBank,
      'sDob': instance.sDob,
      'sKycStatus': instance.sKycStatus,
      'accountReference': instance.accountReference,
    };
