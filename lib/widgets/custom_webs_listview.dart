import 'package:flutter/material.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/misc/read_json.dart';
import 'package:swe_homework/widgets/info_container.dart';

class CustomWebListview extends StatelessWidget {
  const CustomWebListview({super.key, required this.selected});
  final int selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 300,
      child: ListView.separated(
          itemBuilder: (context, index) {
            String webLink = Reader().resumes[selected].websites![index].url!;
            return SizedBox(
              width: 60,
              child: InfoContainer(
                  info: Center(
                child: Text(
                  webLink,
                  style: kTextStyle.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              )),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 6,
              ),
          itemCount: Reader().resumes[selected].websites!.length),
    );
  }
}
