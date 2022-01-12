import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/favourite_shared_prefrences.dart';
import '../../pokemon/Data/models/pokemon.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavouriteSharedPrefrences favouriteSharedPrefrences;
  List<Pokemon> favouritePokemons = [];

  FavouriteBloc(this.favouriteSharedPrefrences)
      : super(const FavouriteInitial([])) {
    on<FavouriteLoadingEvent>((event, emit) async {
      favouritePokemons = await favouriteSharedPrefrences.getFavourites();
      emit(
        FavouriteLoaded(favouritePokemons),
      );
    });

    on<FavouriteToggleEvent>((event, emit) async {
      if (!favouritePokemons.contains(event.pokemon)) {
        favouritePokemons.add(event.pokemon);
      } else if (favouritePokemons.contains(event.pokemon)) {
        favouritePokemons.remove(event.pokemon);
      }
      emit(FavouriteLoading(favouritePokemons));
      await favouriteSharedPrefrences.saveFavourites(favouritePokemons);
      emit(FavouriteLoaded(favouritePokemons));
    });
  }
}
