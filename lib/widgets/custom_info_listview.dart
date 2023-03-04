import 'package:flutter/material.dart';
import 'package:swe_homework/classes/resume.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/misc/read_json.dart';
import 'package:swe_homework/widgets/info_container.dart';

class CustomInfoListview extends StatelessWidget {
  const CustomInfoListview({super.key, required this.selected});
  final int selected;

  @override
  Widget build(BuildContext context) {
    Resume resume = Reader().resumes[selected];
    String name =
        '${resume.candidate!.name!.first!} ${resume.candidate!.name!.last!}';
    String bdate = resume.candidate!.bdate!;
    String linkedinAcc = resume.candidate!.linkedinAcc!;
    String profession = resume.experience!.profession ?? 'Not Specified';
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
                  'Name: $name',
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
                  'Birth Date: $bdate',
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
                  'Linkedin: $linkedinAcc',
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
