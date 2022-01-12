import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pokemon_item.dart';
import '/pokemon/Data/models/pokemon.dart';
import '/pokemon/bloc/pokemon_bloc.dart';

class PokemonGrid extends StatelessWidget {
  const PokemonGrid(
      {Key? key,
      required this.pokemons,
      required this.scrollController,
      required this.buildCircleLoading})
      : super(key: key);

  final List<Pokemon> pokemons;
  final ScrollController scrollController;
  final bool buildCircleLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        child: CustomScrollView(controller: scrollController, slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12.h,
              crossAxisSpacing: 10.w,
              childAspectRatio: 110.w / 186.h,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return PokemonItem(pokemon: pokemons[index]);
              },
              childCount: pokemons.length,
            ),
          ),
          if (buildCircleLoading)
            SliverToBoxAdapter(
              child: BlocBuilder<PokemonBloc, PokemonState>(
                  builder: (context, state) {
                if (state is PokemonLoading) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
            )
        ]));
  }
}
