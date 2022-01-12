import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/favourite_bloc.dart';

class Badge extends StatelessWidget {
  const Badge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
      return CircleAvatar(
        backgroundColor: const Color(0xff3558CD),
        radius: 10.h,
        child: Text(
          state.favouritesPokemon.length.toString(),
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'NotoSans',
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    });
  }
}
