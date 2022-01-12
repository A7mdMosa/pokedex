import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseStatsItem extends StatelessWidget {
  const BaseStatsItem({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);
  final String title;
  final int value;

  Color chartColor(int value) {
    if (value <= 30) {
      return const Color(0xffE0DA00);
    } else if (value <= 60) {
      return const Color(0xff5DE365);
    } else if (value <= 90) {
      return const Color(0xff3E60F3);
    } else if (value > 90) {
      return const Color(0xffE82F88);
    } else {
      return const Color(0xffA0F58C);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 14.h, bottom: 12.h, left: 16.w, right: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'NotoSans',
                  color: const Color(0xff6B6B6B),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'NotoSans',
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
            height: 4.h,
            width: 343.w,
            color: const Color(0xffE8E8E8),
            child: Divider(
              color: chartColor(value),
              thickness: 4.h,
              endIndent: value >= 100 ? 0 : 343.w - ((343.w * value) / 100),
            ),
          ),
        ],
      ),
    );
  }
}
