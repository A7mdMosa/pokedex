import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/pokemon_bloc.dart';
import '../widgets/pokemon_grid.dart';
import 'pokemon_failed_screen.dart';

class AllPokemons extends StatefulWidget {
  const AllPokemons({Key? key}) : super(key: key);

  @override
  State<AllPokemons> createState() => _AllPokemonsState();
}

class _AllPokemonsState extends State<AllPokemons> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        BlocProvider.of<PokemonBloc>(context).add(PokemonUpdatingEvent());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        if (state is PokemonLoaded || state is PokemonLoading) {
          state.pokemons.sort((a, b) => a.id.compareTo(b.id));
          return PokemonGrid(
            pokemons: state.pokemons,
            scrollController: _scrollController,
            buildCircleLoading: true,
          );
        }
        if (state is PokemonFailed) {
          return const PokemonFailedScreen();
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      },
    );
  }
}
