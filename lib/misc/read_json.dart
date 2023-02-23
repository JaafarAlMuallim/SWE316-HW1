import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:swe_homework/classes/resume.dart';

class Reader {
  static List<Resume> resumes = [];
  static Future<List<Resume>> read() async {
    for (int i = 1; i < 4; i++) {
      String response =
          await rootBundle.loadString('assets/CV_Sample_0$i.json');
      dynamic data = await json.decode(response);

      Resume resume = Resume.fromJson(data);
      resumes.add(resume);
    }
    return resumes;
  }
}
