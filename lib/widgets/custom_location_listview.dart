import 'package:flutter/material.dart';
import 'package:swe_homework/classes/candidate.dart';
import 'package:swe_homework/constants.dart';
import 'package:swe_homework/misc/read_json.dart';
import 'package:swe_homework/widgets/info_container.dart';

class CustomLocationListview extends StatelessWidget {
  const CustomLocationListview({super.key, required this.selected});
  final int selected;

  @override
  Widget build(BuildContext context) {
    Candidate candidate = Reader().resumes[selected].candidate!;
    String country = candidate.location!.country!;
    String state = candidate.location!.state!;
    String city = candidate.location!.city!;
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
                  'Country: $country',
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
                  'State: $state',
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
                  'City: $city',
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
