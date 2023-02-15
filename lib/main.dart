import 'package:flutter/material.dart';
import 'package:swe_homework/misc/read_json.dart';
import 'package:swe_homework/myapp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Reader.read();
  runApp(const MyApp());
}
