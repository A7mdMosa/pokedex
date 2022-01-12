import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_screen.dart';
import 'splash_screen.dart';
import 'pokemon/bloc/pokemon_bloc.dart';
import 'pokemon/view/screens/details_screen.dart';
import 'pokemon/Data/api/pokemon_api.dart';
import 'pokemon/Data/repository/pokemon_repository.dart';
import 'favouritePokemon/bloc/favourite_bloc.dart';
import 'favouritePokemon/data/favourite_shared_prefrences.dart';

void main() => runApp(const PokedexApp());

class PokedexApp extends StatelessWidget {
  const PokedexApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                PokemonBloc(PokemonRepository(pokemonApi: PokemonApi())),
          ),
          BlocProvider(
            create: (context) => FavouriteBloc(FavouriteSharedPrefrences()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.route,
          routes: {
            SplashScreen.route: (context) => const SplashScreen(),
            HomeScreen.route: (context) => const HomeScreen(),
            DetailsScreen.route: (context) => const DetailsScreen(),
          },
        ),
      ),
    );
  }
}
