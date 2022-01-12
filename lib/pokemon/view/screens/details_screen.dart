import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/favouritePokemon/bloc/favourite_bloc.dart';
import '/favouritePokemon/view/widgets/add_button.dart';
import '/favouritePokemon/view/widgets/base_stats_item.dart';
import '/favouritePokemon/view/widgets/height_bar.dart';
import '/favouritePokemon/view/widgets/remove_button.dart';
import '/pokemon/Data/models/pokemon.dart';

class DetailsScreen extends StatelessWidget {
  static const String route = '/details_screen';
  const DetailsScreen({Key? key}) : super(key: key);

  String getImagebackGround(Pokemon pokemon) {
    if (pokemon.types.contains('Water') || pokemon.types.contains('Normal')) {
      return 'assets/images/water.png';
    } else if (pokemon.types.contains('Fire') ||
        pokemon.types.contains('Fairy')) {
      return 'assets/images/fire.png';
    } else if (pokemon.types.contains('Grass')) {
      return 'assets/images/grass.png';
    } else if (pokemon.types.contains('Electric') ||
        pokemon.types.contains('Psychic')) {
      return 'assets/images/Electric.png';
    } else if (pokemon.types.contains('Poison')) {
      return 'assets/images/Poison.png';
    } else if (pokemon.types.contains('Ground') ||
        pokemon.types.contains('Fighting')) {
      return 'assets/images/Ground.png';
    } else {
      return 'assets/images/other.png';
    }
  }

  Color getPokemonColor(String types) {
    if (types.contains('Water') || types.contains('Normal')) {
      return const Color(0xffF3F9FE);
    } else if (types.contains('Fire')) {
      return const Color(0xffFDF1F1);
    } else if (types.contains('Grass')) {
      return const Color(0xffF3F9EF);
    } else if (types.contains('Electric') || types.contains('Psychic')) {
      return const Color(0xffF9FFB1);
    } else if (types.contains('Poison')) {
      return const Color(0xffF2E8FF);
    } else if (types.contains('Ground') || types.contains('Fighting')) {
      return const Color(0xffFFECB8);
    } else if (types.contains('Fairy')) {
      return const Color(0xffFFEDEF);
    } else {
      return const Color(0xffE9FFED);
    }
  }

  int avgPowerCaluc(
      {required int attack,
      required int defense,
      required int specialAttack,
      required int specialDefense,
      required int speed}) {
    double avgPower =
        ((attack + defense + specialAttack + specialDefense + speed) / 5);
    return avgPower.round();
  }

  @override
  Widget build(BuildContext context) {
    Pokemon pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;
    return Scaffold(
      backgroundColor: const Color(0xffE8E8E8),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                iconTheme: const IconThemeData(color: Colors.black),
                toolbarHeight: 85.h,
                backgroundColor: Colors.white,
                expandedHeight: 247.h,
                flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                  children: [
                    Container(color: getPokemonColor(pokemon.types)),
                    Positioned(
                        right: -33.w,
                        bottom: -22.h,
                        child: Image.asset(
                          getImagebackGround(pokemon),
                          height: 176.h,
                          width: 176.w,
                        )),
                    Positioned(
                      right: 16.w,
                      bottom: 0,
                      child: Image.network(
                        pokemon.imageUrl,
                        width: 136.w,
                        height: 125.h,
                      ),
                    ),
                    Positioned(
                      bottom: 111.h,
                      left: 16.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pokemon.name,
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontFamily: 'NotoSans',
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            pokemon.types,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'NotoSans',
                              color: const Color(0xff161A33),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 14.h,
                      left: 16.w,
                      child: Text(
                        '#${pokemon.id.toString().padLeft(3, '0')}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'NotoSans',
                          color: const Color(0xff161A33),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                )),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    HeightBar(pokemon: pokemon),
                    Stack(
                      children: [
                        Container(
                          color: Colors.white,
                          height: 468.h,
                          width: 375.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.h, horizontal: 16.w),
                                child: Text(
                                  'Base stats',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'NotoSans',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 1.h,
                                color: const Color(0xffE8E8E8),
                              ),
                              BaseStatsItem(
                                title: 'Hp',
                                value: pokemon.hp,
                              ),
                              BaseStatsItem(
                                title: 'Attack',
                                value: pokemon.attack,
                              ),
                              BaseStatsItem(
                                title: 'Defense',
                                value: pokemon.defense,
                              ),
                              BaseStatsItem(
                                title: 'Special Attack',
                                value: pokemon.specialAttack,
                              ),
                              BaseStatsItem(
                                title: 'Special Defense',
                                value: pokemon.specialDefense,
                              ),
                              BaseStatsItem(
                                title: 'Speed',
                                value: pokemon.speed,
                              ),
                              BaseStatsItem(
                                title: 'Avg.Power',
                                value: avgPowerCaluc(
                                    attack: pokemon.attack,
                                    defense: pokemon.defense,
                                    specialAttack: pokemon.specialAttack,
                                    specialDefense: pokemon.specialDefense,
                                    speed: pokemon.speed),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 25.h,
              right: 16.w,
              child: BlocBuilder<FavouriteBloc, FavouriteState>(
                builder: (context, state) {
                  if (state.favouritesPokemon.contains(pokemon)) {
                    return RemoveButton(pokemon: pokemon);
                  } else {
                    return AddButton(pokemon: pokemon);
                  }
                },
              )),
        ],
      ),
    );
  }
}
