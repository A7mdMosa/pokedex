import 'dart:convert';

import '../../pokemon/Data/models/pokemon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteSharedPrefrences {
  static const sharedPrefKey = "PokemonsKey";

  Future<void> saveFavourites(List<Pokemon> favouritePokemons) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String pokemonsJson = jsonEncode(favouritePokemons);
    pref.clear();
    pref.setString(sharedPrefKey, pokemonsJson);
  }

  Future<List<Pokemon>> getFavourites() async {
    final List<Pokemon> favouritePokemons = [];
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? json = pref.getString(sharedPrefKey);

    if (json == null) {
      return favouritePokemons;
    } else {
      for (Map<String, dynamic> pokemonMap in jsonDecode(json)) {
        favouritePokemons.add(Pokemon.fromSharedPrefJson(pokemonMap));
      }
      return favouritePokemons;
    }
  }
}
