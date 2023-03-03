import 'package:flutter/material.dart';
import 'package:swe_homework/classes/certifications.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/misc/read_json.dart';
import 'package:swe_homework/widgets/info_container.dart';

class CustomCertifsListview extends StatelessWidget {
  const CustomCertifsListview({super.key, required this.selected});
  final int selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 300,
      child: ListView.separated(
          itemBuilder: (context, index) {
            Certification certifs =
                Reader().resumes[selected].certifications[index];
            String text = '${certifs.certificate}';
            return SizedBox(
              width: 60,
              child: InfoContainer(
                  info: Text(text,
                      style: kTextStyle.copyWith(fontSize: 14),
                      textAlign: TextAlign.center)),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 6,
              ),
          itemCount: Reader().resumes[selected].certifications.length),
    );
  }
}
