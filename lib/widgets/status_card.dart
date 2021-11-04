import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:patriot/models/patriot_object/patriot_object.dart';
import 'package:patriot/models/status/status.dart';
import 'package:patriot/services/enum_values.dart';

class StatusCard extends StatelessWidget {
  StatusCard({Key? key, required this.status, required this.patriotObject}) : super(key: key);
  final Status status;
  final PatriotObject patriotObject;

  final eventTypeValues = EnumValues<Color>({
    "alarm": Colors.red,
    "arm": Colors.green,
    "disarm": Colors.grey,
    "fault": Colors.grey,
    "other": Colors.grey,
    "restore": Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335.w,
      height: 88.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 27.w,
            height: 27.h,
            child: Icon(Icons.error, color: eventTypeValues.map[status.eventType!],),
          ),
          SizedBox(
            width: 24.w,
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 2.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      status.eventName!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        height: 19.36 / 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      DateFormat('d MMM, H:m', "ru_RU").format(status.eventDate!),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        height: 16 / 12,
                        color: const Color(0xFF727272),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 9.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Вторжение , «Сейфовая»",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: 16 / 14,
                      color: const Color(0xFF727272),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    patriotObject.address!.split(',').last + " • Объект " + patriotObject.id!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: 16 / 14,
                      color: const Color(0xFF727272),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 1.h,
                  color: Colors.white.withOpacity(.15),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
