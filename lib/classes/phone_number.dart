class PhoneNumber {
  String? _phoneNum;
  get phoneNum => _phoneNum;

  // set phoneNum(value) => _phoneNum = value;

  PhoneNumber({required String phoneNum}) {
    _phoneNum = phoneNum;
  }
  factory PhoneNumber.fromJson(dynamic json, int index) {
    dynamic data = json['Value']['Data'];
    return PhoneNumber(
      phoneNum: data['PhoneNumbers'][index],
    );
  }
}
