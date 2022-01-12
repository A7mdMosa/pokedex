part of 'favourite_bloc.dart';

abstract class FavouriteState extends Equatable {
  final List<Pokemon> favouritesPokemon;
  const FavouriteState(this.favouritesPokemon);

  @override
  List<Object> get props => [favouritesPokemon];
}

class FavouriteInitial extends FavouriteState {
  const FavouriteInitial(List<Pokemon> favouritesPokemon)
      : super(favouritesPokemon);
}

class FavouriteLoaded extends FavouriteState {
  const FavouriteLoaded(List<Pokemon> favouritesPokemon)
      : super(favouritesPokemon);
}

class FavouriteLoading extends FavouriteState {
  const FavouriteLoading(List<Pokemon> favouritesPokemon)
      : super(favouritesPokemon);
}
