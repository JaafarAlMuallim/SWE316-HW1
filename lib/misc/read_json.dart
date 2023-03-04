import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:swe_homework/classes/resume.dart';

class Reader {
  static final List<Resume> _resumes = [];

  List<Resume> get resumes => _resumes;
  Future<List<Resume>> read() async {
    String res = await rootBundle.loadString('assets/jsons/CVs.json');
    Map<String, dynamic> data = await json.decode(res);
    List<dynamic> cvs = data['CVs'];
    for (int i = 0; i < cvs.length; i++) {
      String response = await rootBundle.loadString(cvs[i]);
      Map<String, dynamic> data = await json.decode(response);
      Resume resume = Resume.fromJson(data);
      _resumes.add(resume);
    }
    return _resumes;
  }
}
