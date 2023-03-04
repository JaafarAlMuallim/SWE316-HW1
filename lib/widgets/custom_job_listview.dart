import 'package:flutter/material.dart';
import 'package:swe_homework/classes/job.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/misc/read_json.dart';
import 'package:swe_homework/widgets/info_container.dart';

class CustomJobsListview extends StatelessWidget {
  const CustomJobsListview({super.key, required this.selected});
  final int selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 300,
      child: ListView.separated(
          itemBuilder: (context, index) {
            Job job = Reader().resumes[selected].experience!.jobs![index];
            String text =
                'From ${job.date!.start!.split('-')[0]} - Until  ${job.date!.end!.split('-')[0]}';
            return SizedBox(
              width: 60,
              child: InfoContainer(
                  info: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(job.jobTitle!,
                      style: kTextStyle.copyWith(fontSize: 14),
                      textAlign: TextAlign.center),
                  Text(
                    text,
                    style: kTextStyle.copyWith(fontSize: 14),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 6,
              ),
          itemCount: Reader().resumes[selected].experience!.jobs!.length),
    );
  }
}
