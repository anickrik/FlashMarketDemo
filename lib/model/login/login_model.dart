/// status : "200"
/// message : "Success"
/// result : {"userInfo":{"firstName":"Kishan","lastName":"Chotaliya","email":"kishan@e2logy.com","mobileNumber":"0499999999","unitNo":"","suburb":"Wangara","address":"13 Profit Pass","postCode":"6065","regionId":"73a8b919-af0e-4bee-9e23-48b9d7c93b4a","profileImage":"","cartCode":"455BA927","userCode":"9F48B526","headerToken":"stCx6thzD3WUFcPWKGI25SceUy5CCbWKlrIGKDiq4w0=","aesPassKey":"594a9a60f7a28b3fe28fa0afc9f6538b"}}
/// notificationCount : 100
/// cartCount : 3

class LoginModel {
  LoginModel({
      String? status, 
      String? message, 
      Result? result, 
      num? notificationCount, 
      num? cartCount,}){
    _status = status;
    _message = message;
    _result = result;
    _notificationCount = notificationCount;
    _cartCount = cartCount;
}

  LoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
    _notificationCount = json['notificationCount'];
    _cartCount = json['cartCount'];
  }
  String? _status;
  String? _message;
  Result? _result;
  num? _notificationCount;
  num? _cartCount;
LoginModel copyWith({  String? status,
  String? message,
  Result? result,
  num? notificationCount,
  num? cartCount,
}) => LoginModel(  status: status ?? _status,
  message: message ?? _message,
  result: result ?? _result,
  notificationCount: notificationCount ?? _notificationCount,
  cartCount: cartCount ?? _cartCount,
);
  String? get status => _status;
  String? get message => _message;
  Result? get result => _result;
  num? get notificationCount => _notificationCount;
  num? get cartCount => _cartCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    map['notificationCount'] = _notificationCount;
    map['cartCount'] = _cartCount;
    return map;
  }

}

/// userInfo : {"firstName":"Kishan","lastName":"Chotaliya","email":"kishan@e2logy.com","mobileNumber":"0499999999","unitNo":"","suburb":"Wangara","address":"13 Profit Pass","postCode":"6065","regionId":"73a8b919-af0e-4bee-9e23-48b9d7c93b4a","profileImage":"","cartCode":"455BA927","userCode":"9F48B526","headerToken":"stCx6thzD3WUFcPWKGI25SceUy5CCbWKlrIGKDiq4w0=","aesPassKey":"594a9a60f7a28b3fe28fa0afc9f6538b"}

class Result {
  Result({
      UserInfo? userInfo,}){
    _userInfo = userInfo;
}

  Result.fromJson(dynamic json) {
    _userInfo = json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
  }
  UserInfo? _userInfo;
Result copyWith({  UserInfo? userInfo,
}) => Result(  userInfo: userInfo ?? _userInfo,
);
  UserInfo? get userInfo => _userInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_userInfo != null) {
      map['userInfo'] = _userInfo?.toJson();
    }
    return map;
  }

}

/// firstName : "Kishan"
/// lastName : "Chotaliya"
/// email : "kishan@e2logy.com"
/// mobileNumber : "0499999999"
/// unitNo : ""
/// suburb : "Wangara"
/// address : "13 Profit Pass"
/// postCode : "6065"
/// regionId : "73a8b919-af0e-4bee-9e23-48b9d7c93b4a"
/// profileImage : ""
/// cartCode : "455BA927"
/// userCode : "9F48B526"
/// headerToken : "stCx6thzD3WUFcPWKGI25SceUy5CCbWKlrIGKDiq4w0="
/// aesPassKey : "594a9a60f7a28b3fe28fa0afc9f6538b"

class UserInfo {
  UserInfo({
      String? firstName, 
      String? lastName, 
      String? email, 
      String? mobileNumber, 
      String? unitNo, 
      String? suburb, 
      String? address, 
      String? postCode, 
      String? regionId, 
      String? profileImage, 
      String? cartCode, 
      String? userCode, 
      String? headerToken, 
      String? aesPassKey,}){
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _mobileNumber = mobileNumber;
    _unitNo = unitNo;
    _suburb = suburb;
    _address = address;
    _postCode = postCode;
    _regionId = regionId;
    _profileImage = profileImage;
    _cartCode = cartCode;
    _userCode = userCode;
    _headerToken = headerToken;
    _aesPassKey = aesPassKey;
}

  UserInfo.fromJson(dynamic json) {
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _mobileNumber = json['mobileNumber'];
    _unitNo = json['unitNo'];
    _suburb = json['suburb'];
    _address = json['address'];
    _postCode = json['postCode'];
    _regionId = json['regionId'];
    _profileImage = json['profileImage'];
    _cartCode = json['cartCode'];
    _userCode = json['userCode'];
    _headerToken = json['headerToken'];
    _aesPassKey = json['aesPassKey'];
  }
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _mobileNumber;
  String? _unitNo;
  String? _suburb;
  String? _address;
  String? _postCode;
  String? _regionId;
  String? _profileImage;
  String? _cartCode;
  String? _userCode;
  String? _headerToken;
  String? _aesPassKey;
UserInfo copyWith({  String? firstName,
  String? lastName,
  String? email,
  String? mobileNumber,
  String? unitNo,
  String? suburb,
  String? address,
  String? postCode,
  String? regionId,
  String? profileImage,
  String? cartCode,
  String? userCode,
  String? headerToken,
  String? aesPassKey,
}) => UserInfo(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  mobileNumber: mobileNumber ?? _mobileNumber,
  unitNo: unitNo ?? _unitNo,
  suburb: suburb ?? _suburb,
  address: address ?? _address,
  postCode: postCode ?? _postCode,
  regionId: regionId ?? _regionId,
  profileImage: profileImage ?? _profileImage,
  cartCode: cartCode ?? _cartCode,
  userCode: userCode ?? _userCode,
  headerToken: headerToken ?? _headerToken,
  aesPassKey: aesPassKey ?? _aesPassKey,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get mobileNumber => _mobileNumber;
  String? get unitNo => _unitNo;
  String? get suburb => _suburb;
  String? get address => _address;
  String? get postCode => _postCode;
  String? get regionId => _regionId;
  String? get profileImage => _profileImage;
  String? get cartCode => _cartCode;
  String? get userCode => _userCode;
  String? get headerToken => _headerToken;
  String? get aesPassKey => _aesPassKey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['mobileNumber'] = _mobileNumber;
    map['unitNo'] = _unitNo;
    map['suburb'] = _suburb;
    map['address'] = _address;
    map['postCode'] = _postCode;
    map['regionId'] = _regionId;
    map['profileImage'] = _profileImage;
    map['cartCode'] = _cartCode;
    map['userCode'] = _userCode;
    map['headerToken'] = _headerToken;
    map['aesPassKey'] = _aesPassKey;
    return map;
  }

}