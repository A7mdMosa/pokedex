import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../pokemon/view/widgets/pokemon_grid.dart';
import '../../bloc/favourite_bloc.dart';

class Favourites extends StatelessWidget {
  Favourites({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder: (context, state) {
        if (state.favouritesPokemon.isNotEmpty) {
          return PokemonGrid(
            pokemons: state.favouritesPokemon,
            scrollController: _scrollController,
            buildCircleLoading: false,
          );
        }
        return Center(
          child: Text(
            'You have no favourites',
            style: TextStyle(
              fontSize: 15.sp,
              fontFamily: 'NotoSans',
              color: const Color(0xff6B6B6B),
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      },
    );
  }
}
