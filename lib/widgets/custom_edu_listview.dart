import 'package:flutter/material.dart';
import 'package:swe_homework/classes/education.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/misc/read_json.dart';
import 'package:swe_homework/widgets/info_container.dart';

class CustomEducationListview extends StatelessWidget {
  const CustomEducationListview({super.key, required this.selected});
  final int selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 300,
      child: ListView.separated(
          itemBuilder: (context, index) {
            Education edu = Reader.resumes[selected].education[index];
            return SizedBox(
              width: 60,
              child: InfoContainer(
                info: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Text('${edu.org}',
                          style: kTextStyle.copyWith(fontSize: 14),
                          textAlign: TextAlign.center),
                    ),
                    Center(
                      child: Text(
                          'Grade: ${edu.grade.value} ${edu.grade.metric}',
                          style: kTextStyle.copyWith(fontSize: 14),
                          textAlign: TextAlign.center),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 6,
              ),
          itemCount: Reader.resumes[selected].education.length),
    );
  }
}
