part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent {}

class PokemonLoadingEvent extends PokemonEvent {}

class PokemonUpdatingEvent extends PokemonEvent {}
