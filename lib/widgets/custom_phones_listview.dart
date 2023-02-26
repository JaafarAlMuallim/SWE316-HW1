import 'package:flutter/material.dart';
import 'package:swe_homework/classes/phone_number.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/misc/read_json.dart';
import 'package:swe_homework/widgets/info_container.dart';

class CustomPhoneListview extends StatelessWidget {
  const CustomPhoneListview({super.key, required this.selected});
  final int selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 300,
      child: ListView.separated(
          itemBuilder: (context, index) {
            PhoneNumber num =
                Reader().resumes[selected].candidate.phoneNums[index];
            return SizedBox(
              width: 60,
              child: InfoContainer(
                  info: Center(
                child: Text(
                  num.phoneNum,
                  style: kTextStyle.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              )),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 6,
              ),
          itemCount: Reader().resumes[selected].candidate.phoneNums.length),
    );
  }
}
