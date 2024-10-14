import 'package:json_annotation/json_annotation.dart';
part 'get_user_details_response.g.dart';

@JsonSerializable()
class GetAllUserDetailsResponse {
  final bool? status;
  final String? msg;
  final String? name;
  @JsonKey(name: "all_details")
  final AllDetails? allDetails;
  final String? balance;

  GetAllUserDetailsResponse({
    this.status,
    this.msg,
    this.name,
    this.allDetails,
    this.balance,
  });

  factory GetAllUserDetailsResponse.fromJson(Map<String, dynamic> json) => _$GetAllUserDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllUserDetailsResponseToJson(this);
}


@JsonSerializable()
class AllDetails {
  final int? sId;
  final String? sApiKey;
  final String? sFname;
  final String? sLname;
  final String? sEmail;
  final String? sPhone;
  final String? sPass;
  final String? sState;
  final int? sPin;
  final int? sPinStatus;
  final String? sNin;
  final String? sBvn;
  final dynamic sRef;
  final int? sType;
  final int? sWallet;
  final int? sRefWallet;
  final dynamic sBankNo;
  final dynamic sRolexBank;
  final dynamic sSterlingBank;
  final dynamic sFidelityBank;
  final dynamic sBankName;
  final int? sRegStatus;
  final int? sVerCode;
  final DateTime? sRegDate;
  final dynamic sLastActivity;
  final String? sReferal;
  final dynamic sPayvesselBank;
  final dynamic sDob;
  final dynamic sKycStatus;
  final dynamic accountReference;

  AllDetails({
    this.sId,
    this.sApiKey,
    this.sFname,
    this.sLname,
    this.sEmail,
    this.sPhone,
    this.sPass,
    this.sState,
    this.sPin,
    this.sPinStatus,
    this.sNin,
    this.sBvn,
    this.sRef,
    this.sType,
    this.sWallet,
    this.sRefWallet,
    this.sBankNo,
    this.sRolexBank,
    this.sSterlingBank,
    this.sFidelityBank,
    this.sBankName,
    this.sRegStatus,
    this.sVerCode,
    this.sRegDate,
    this.sLastActivity,
    this.sReferal,
    this.sPayvesselBank,
    this.sDob,
    this.sKycStatus,
    this.accountReference,
  });

  factory AllDetails.fromJson(Map<String, dynamic> json) => _$AllDetailsFromJson(json);
      

  Map<String, dynamic> toJson() => _$AllDetailsToJson(this);
        
}
