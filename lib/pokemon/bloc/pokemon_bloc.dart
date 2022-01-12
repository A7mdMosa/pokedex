import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../Data/models/pokemon.dart';
import 'package:pokedex/pokemon/Data/repository/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository pokemonRepository;
  List<Pokemon> pokemons = [];
  int offsets = 0;

  PokemonBloc(this.pokemonRepository) : super(const PokemonInitial([])) {
    on<PokemonLoadingEvent>((event, emit) async {
      try {
        pokemons = await pokemonRepository.getPokemonsDetails(offsets);
        emit(
          PokemonLoaded(pokemons),
        );
      } catch (e) {
        emit(
          PokemonFailed(pokemons),
        );
      }
    });
    on<PokemonUpdatingEvent>((event, emit) async {
      try {
        offsets += 18;
        emit(PokemonLoading(pokemons));
        List<Pokemon> newPokemons =
            await pokemonRepository.getPokemonsDetails(offsets);
        for (Pokemon newPokemon in newPokemons) {
          pokemons.add(newPokemon);
        }
        emit(PokemonLoaded(pokemons));
      } catch (e) {
        emit(
          PokemonFailed(pokemons),
        );
      }
    });
  }
}
