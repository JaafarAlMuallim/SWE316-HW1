class Email {
  String? _email;

  String? get email => _email;
  // set email(value) => _email = value;

  Email({required String email}) {
    _email = email;
  }
  factory Email.fromJson(Map<String, dynamic> json, int index) {
    Map<String, dynamic> data = json['Value']['Data'];
    return Email(
      email: data['Emails'][index],
    );
  }
}
