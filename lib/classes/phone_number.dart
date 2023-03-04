class PhoneNumber {
  String? _phoneNum;

  String? get phoneNum => _phoneNum;

  // set phoneNum(value) => _phoneNum = value;

  PhoneNumber({required String phoneNum}) {
    _phoneNum = phoneNum;
  }
  factory PhoneNumber.fromJson(Map<String, dynamic> json, int index) {
    Map<String, dynamic> data = json['Value']['Data'];
    return PhoneNumber(
      phoneNum: data['PhoneNumbers'][index],
    );
  }
}
