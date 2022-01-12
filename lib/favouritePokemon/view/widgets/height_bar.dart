import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../pokemon/Data/models/pokemon.dart';

class HeightBar extends StatelessWidget {
  const HeightBar({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  String bmiCalc({required int height, required int weight}) {
    String bmi =
        ((weight / 10) / ((height / 10) * (height / 10))).toStringAsFixed(1);
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 68.h,
      width: 375.w,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      margin: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InfoBarWidget(
            title: 'Height',
            value: '${(pokemon.height / 10)} m',
          ),
          SizedBox(
            width: 48.w,
          ),
          InfoBarWidget(
            title: 'Weight',
            value: '${(pokemon.weight / 10)} kgs',
          ),
          SizedBox(
            width: 48.w,
          ),
          InfoBarWidget(
            title: 'BMI',
            value: bmiCalc(height: pokemon.height, weight: pokemon.weight),
          ),
        ],
      ),
    );
  }
}

class InfoBarWidget extends StatelessWidget {
  const InfoBarWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'NotoSans',
            color: const Color(0xff6B6B6B),
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'NotoSans',
            color: const Color(0xff161A33),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
