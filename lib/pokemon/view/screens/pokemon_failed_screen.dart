import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/pokemon/bloc/pokemon_bloc.dart';

class PokemonFailedScreen extends StatelessWidget {
  const PokemonFailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/pokemonFailed.png'),
          Text(
            'Pokemon Failed Loading ...',
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'NotoSans',
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          MaterialButton(
              minWidth: 157.w,
              height: 50.h,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'Try Agian',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'NotoSans',
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () {
                BlocProvider.of<PokemonBloc>(context).add(
                  PokemonLoadingEvent(),
                );
              })
        ],
      ),
    );
  }
}
