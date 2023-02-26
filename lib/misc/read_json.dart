import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:swe_homework/classes/resume.dart';

class Reader {
  static final List<Resume> _resumes = [];

  get resumes => _resumes;
  Future<List<Resume>> read() async {
    for (int i = 1; i < 4; i++) {
      String response =
          await rootBundle.loadString('assets/CV_Sample_0$i.json');
      dynamic data = await json.decode(response);
      Resume resume = Resume.fromJson(data);
      _resumes.add(resume);
    }
    return _resumes;
  }
}
