import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/favourite_bloc.dart';
import '../../../pokemon/Data/models/pokemon.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 201.w,
        height: 50.h,
        color: const Color(0xffD5DEFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          'Remove from favourite',
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'NotoSans',
            color: const Color(0xff3558CD),
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: () {
          BlocProvider.of<FavouriteBloc>(context)
              .add(FavouriteToggleEvent(pokemon));
        });
  }
}
