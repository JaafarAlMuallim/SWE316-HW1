import 'package:flutter/material.dart';
import 'package:swe_homework/classes/experience.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/misc/read_json.dart';
import 'package:swe_homework/widgets/info_container.dart';

class CustomExpListview extends StatelessWidget {
  const CustomExpListview({super.key, required this.selected});
  final int selected;

  @override
  Widget build(BuildContext context) {
    Experience exp = Reader().resumes[selected].experience!;
    String profession = exp.profession!;
    int yexp = exp.expYears!;

    return SizedBox(
      height: 150,
      width: 300,
      child: ListView(
        children: [
          SizedBox(
            width: 60,
            child: InfoContainer(
              info: Center(
                child: Text(
                  'Profession: $profession',
                  style: kTextStyle.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            width: 60,
            child: InfoContainer(
              info: Center(
                child: Text(
                  'Years of Experience: $yexp',
                  style: kTextStyle.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
        ],
      ),
    );
  }
}
