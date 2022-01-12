import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_screen.dart';
import 'pokemon/bloc/pokemon_bloc.dart';
import 'favouritePokemon/bloc/favourite_bloc.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PokemonBloc>(context).add(PokemonLoadingEvent());
    BlocProvider.of<FavouriteBloc>(context).add(FavouriteLoadingEvent());
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF3558CD),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Center(
          child: SvgPicture.asset(
            'assets/images/Splash.svg',
            height: 82.h,
            width: 295.w,
          ),
        ),
      ),
    );
  }
}
