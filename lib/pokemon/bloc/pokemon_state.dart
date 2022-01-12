part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState extends Equatable {
  @override
  List<Object?> get props => [pokemons];

  final List<Pokemon> pokemons;
  const PokemonState(this.pokemons);
}

class PokemonInitial extends PokemonState {
  const PokemonInitial(List<Pokemon> pokemons) : super(pokemons);
}

class PokemonLoading extends PokemonState {
  const PokemonLoading(List<Pokemon> pokemons) : super(pokemons);
}

class PokemonLoaded extends PokemonState {
  const PokemonLoaded(List<Pokemon> pokemons) : super(pokemons);
}

class PokemonFailed extends PokemonState {
  const PokemonFailed(List<Pokemon> pokemons) : super(pokemons);
}
