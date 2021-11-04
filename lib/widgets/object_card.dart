import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:patriot/models/patriot_object/patriot_object.dart';
import 'package:patriot/services/enum_values.dart';

class ObjectCard extends StatelessWidget {
  ObjectCard({
    Key? key,
    required this.patriotObject,
  }) : super(key: key);
  final PatriotObject patriotObject;
  final eventTypeValues = EnumValues<Color>({
    "alarm": const Color(0xFFC43642),
    "arm": const Color(0xFF499356),
    "disarm": const Color(0xFF757575).withOpacity(0.4),
    "fault": const Color(0xFF757575).withOpacity(0.4),
    "other": const Color(0xFF757575).withOpacity(0.4),
    "restore": const Color(0xFF757575).withOpacity(0.4),
  });
  final eventTypeValuesText = EnumValues<Color>({
    "alarm": const Color(0xFFEB4655),
    "arm": const Color(0xFF62AD6F),
    "disarm": const Color(0xFF797979),
    "fault": const Color(0xFF797979),
    "other": const Color(0xFF797979),
    "restore": const Color(0xFF797979),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 155.h,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: eventTypeValues.map[patriotObject.list![0].eventType!],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: 98.w,
            height: 12.h,
            child: Text(
              DateFormat('d MMM, H:m', "ru_RU").format(patriotObject.list![0].eventDate!),
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                height: 1.21,
                color: Colors.white.withOpacity(0.4),
              ),
            ),
          ),
          SizedBox(
            height: 17.h,
          ),
          Text(
            patriotObject.list![0].eventName!,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: eventTypeValuesText.map[patriotObject.list![0].eventType!],
              height: 18.15 / 15,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            patriotObject.list![0].eventDescription!,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 15.73 / 13,
            ),
          ),
          SizedBox(
            height: 6.5.h,
          ),
          Divider(
            height: 27.h,
            thickness: 0.5.h,
            color: Colors.white.withOpacity(0.05),
          ),
          Text(
            patriotObject.address!.split(',').last + " • Объект " + patriotObject.id!,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 15.73 / 13,
            ),
          ),
        ],
      ),
    );
  }
}
