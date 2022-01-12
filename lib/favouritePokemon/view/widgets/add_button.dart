import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/favourite_bloc.dart';
import '../../../pokemon/Data/models/pokemon.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 157.w,
        height: 50.h,
        color: const Color(0xff3558CD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          'Mark as favourite',
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'NotoSans',
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: () {
          BlocProvider.of<FavouriteBloc>(context)
              .add(FavouriteToggleEvent(pokemon));
        });
  }
}
