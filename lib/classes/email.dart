class Email {
  String? _email;
  get email => _email;
  // set email(value) => _email = value;

  Email({required String email}) {
    _email = email;
  }
  factory Email.fromJson(dynamic json, int index) {
    dynamic data = json['Value']['Data'];
    return Email(
      email: data['Emails'][index],
    );
  }
}
