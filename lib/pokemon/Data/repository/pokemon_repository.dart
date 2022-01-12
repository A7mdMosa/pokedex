import '../api/pokemon_api.dart';
import '../models/pokemon.dart';

class PokemonRepository {
  final PokemonApi pokemonApi;
  PokemonRepository({required this.pokemonApi});

  Future<List<Pokemon>> getPokemonsDetails(int offset) async {
    final List<String> _pokemonsUrls = [];
    final List<Pokemon> _loadedPokemons = [];
    final pokemonsUrlsData = await pokemonApi.getPokemonsUrls(offset);
    for (var element in pokemonsUrlsData) {
      _pokemonsUrls.add(element['url']);
    }
    for (String pokemonUrl in _pokemonsUrls) {
      Map<String, dynamic> pokemonData =
          await pokemonApi.getPokemonDetails(pokemonUrl);
      _loadedPokemons.add(
        Pokemon.fromJson(pokemonData),
      );
    }
    return _loadedPokemons;
  }
}
